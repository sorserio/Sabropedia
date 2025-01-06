document.addEventListener('DOMContentLoaded', () => {
    const stars = document.querySelectorAll('.star');
    const ratingValue = document.getElementById('rating-value');
    let selectedValue = 0; // Valor para guardar la selección del usuario

    stars.forEach((star, index) => {
        // Selección permanente al hacer clic
        star.addEventListener('click', () => {
            selectedValue = index + 1; // Guarda la selección del usuario
            ratingValue.value = selectedValue;

            // Marca las estrellas seleccionadas
            stars.forEach((s, i) => {
                s.classList.toggle('selected', i < selectedValue);
            });
        });

        // Resalta temporalmente las estrellas al pasar el cursor
        star.addEventListener('mouseover', () => {
            stars.forEach((s, i) => {
                s.classList.toggle('selected', i <= index);
            });
        });

        // Restaura las estrellas según la selección del usuario al salir del área
        star.addEventListener('mouseout', () => {
            stars.forEach((s, i) => {
                s.classList.toggle('selected', i < selectedValue);
            });
        });
    });
});
