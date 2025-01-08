document.addEventListener('DOMContentLoaded', function() {
    // Seleccionamos los botones por su id
    const registroPersonaBtn = document.getElementById('registroPersona');
    const registroComercialBtn = document.getElementById('registroComercial');
    
    // Evento para el botón "Regístrate como Persona"
    registroPersonas.addEventListener('click', function() {
        window.location.href = 'registroPersonas.html';  // Redirige a la página de registro de persona
    });

    // Evento para el botón "Regístrate como Comercial"
    registroLocal.addEventListener('click', function() {
        window.location.href = 'registroLocales.html';  // Redirige a la página de registro comercial
    });
});


