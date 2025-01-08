document.addEventListener('DOMContentLoaded', function() {
    // Seleccionamos los botones por su id
    const registroPersonaBtn = document.getElementById('registroPersona');
    const registroComercialBtn = document.getElementById('registroComercial');
    
    // Evento para el botón "Regístrate como Persona"
    registroPersonaBtn.addEventListener('click', function() {
        window.location.href = 'registroPersona.html';  // Redirige a la página de registro de persona
    });

    // Evento para el botón "Regístrate como Comercial"
    registroComercialBtn.addEventListener('click', function() {
        window.location.href = 'registroComercial.html';  // Redirige a la página de registro comercial
    });
});


