const reviewsContainer = document.getElementById("reviews-container");
const reviewForm = document.getElementById("review-form");

// Obtener reseñas desde el backend
async function fetchReviews() {
    const response = await fetch("http://localhost:5500/reviews");
    const reviews = await response.json();

    reviewsContainer.innerHTML = "";
    reviews.forEach((review) => {
        const reviewElement = document.createElement("div");
        reviewElement.className = "review";
        reviewElement.innerHTML = `
            <p><strong>Usuario</strong> (${review.rating} estrellas): "${review.comment}"</p>
        `;
        reviewsContainer.appendChild(reviewElement);
    });
}

// Enviar nueva reseña
reviewForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const comment = document.getElementById("review-comment").value;
    const rating = document.getElementById("rating-value").value;

    await fetch("http://localhost:5500/detalles", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ comment, rating }),
    });

    reviewForm.reset();
    fetchReviews();
});

// Inicializar
fetchReviews();