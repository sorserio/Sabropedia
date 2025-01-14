<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <script src="js/login.js"></script>
    <title>Inicio de Sesión</title>
</head>

<body>
    <header>
        <div class="headerSection">
            <a href="/inicio">
                <img class="logo" src="./images/logo.png" alt="logo">
            </a>
        </div>
    </header>
    <main>
        <section class="p-form">
            <div class="login-box">
                <h2 class="loginMsg">Ingresa tu nueva contraseña:</h2>
                <form:form action="/procesa/recuperar" method="post" modelAttribute="loginUsuario">
          
                                        <form:label path="email">Email:</form:label>
					<form:input path="email" type="text" placeholder="Ingresa tu email"/>
					<form:errors class="error" path="email" />
					
					
					<form:label path="contraseña">Contraseña:</form:label>
					<form:input path="contraseña" type="password" placeholder="Ingresa tu contraseña"/>
					<form:errors class="error" path="contraseña" />

                    <button type="submit">Restablecer contraseña</button>
                </form:form>
            </div>
        </section>
    </main>
    <footer>
        <div class="footer-container">
            <p>&copy; 2024 Sabropedia. Todos los derechos reservados.</p>
            <p><a href="mailto:admin@sabropedia.com">Contacto con los administradores</a></p>
            <div class="social-links">
                <a href="#" class="social-icon"><i class="fab fa-facebook"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            </div>
            <p><a href="/politicas.html" class="politicas">Consulta nuestras políticas de privacidad y datos del
                    usuario</a></p>
        </div>
    </footer>
</body>

</html>