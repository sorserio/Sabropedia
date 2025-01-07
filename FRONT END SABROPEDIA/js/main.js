document.addEventListener('DOMContentLoaded', () => {
    const userProfilePic = "ruta/a/la/foto/del/usuario.jpg"; // Cambia por la URL de la imagen del usuario
    const profilePicture = document.querySelector('.user-profile img');

    if (userProfilePic) {
        profilePicture.src = userProfilePic;
    }
});



document.getElementById('menu-toggle').addEventListener('click', function () {
    const navLinks = document.querySelector('.nav-links');
    navLinks.classList.toggle('active');  // Toggle entre mostrar y ocultar el menú
});
