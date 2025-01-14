let currentSlide = 0;

function showSlide(index) {
    const slides = document.querySelectorAll(".foto-carrusel");
    const totalSlides = slides.length;

    if (index >= totalSlides) {
        currentSlide = 0; // Regresa al inicio si llega al final
    } else if (index < 0) {
        currentSlide = totalSlides - 1; // Va al final si intenta ir atrás desde el inicio
    } else {
        currentSlide = index;
    }

    const offset = -currentSlide * 100; // Calcula el desplazamiento
    document.querySelector(".carrusel-inner").style.transform = `translateX(${offset}%)`;
}

function prevSlide() {
    showSlide(currentSlide - 1);
}

function nextSlide() {
    showSlide(currentSlide + 1);
}

// Inicializa el carrusel
showSlide(currentSlide);