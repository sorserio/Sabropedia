<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="css/registroLocales.css">
    <script src="js/login.js"></script>
    <title>Inicio de Sesión</title>
</head>
<body>
	<header>
        <div class="headerSection">
            <a href="/index.html">
                <img class="logo" src="./images/logo.png" alt="logo">
            </a>
        </div>
    </header>
    
        <main>
        <section class="p-form">
            <div class="login-box">
                <h2 class="loginMsg">Muéstrale al mundo tu negocio!</h2>
                <form:form action="/procesa/registroComercio" method="POST" modelAttribute="usuarioComercio">
                
                    <form:label path="nombre">Nombre:</form:label>
                    <form:input path="nombre" type="text" placeholder="Ingresa tu nombre"/>
                    <form:errors class="error" path="nombre"/>
                    
                    <form:label path="apellido">Apellido:</form:label>
					<form:input path="apellido" type="text" placeholder="Ingresa tu apellido"/>
					<form:errors class="error" path="apellido" />
			
			        <form:label path="telefono">Teléfono:</form:label>
                    <form:input path="telefono" type="phone" placeholder="Ingresa tu teléfono"/>
                    <form:errors class="error" path="contraseña"/>
			
					<form:label path="email">Email:</form:label>
					<form:input path="email" type="text" placeholder="Ingresa tu email"/>
					<form:errors class="error" path="email" />
					
					<form:label path="contraseña">Contraseña:</form:label>
					<form:input path="contraseña" type="text" placeholder="Ingresa tu contraseña"/>
					<form:errors class="error" path="contraseña" />
					
					<form:label path="confirmarContraseña">Confirmar Contraseña:</form:label>
					<form:input path="confirmarContraseña" type="text" placeholder="Confirma tu contraseña"/>
					<form:errors class="error" path="confirmarContraseña" />

                    <button  type="submit">Crear cuenta</button>
                </form:form>
                
                <div class="sign-up">
                    <p>
                        <a href="/recuperarLocal" class="reset">¿Olvidaste tu contraseña?</a>
                        <br><br>
                        Únete y forma parte de la comunidad con el mejor sazón.
                    </p>
 					<a href="/"><button id="registroPersona">
                        <i class="fa-solid fa-user"></i> Regístrate como Persona
                    </button></a>
                    <a href="/loginLocal"><button id="registroComercial">
                        <i class="fa-solid fa-shop"></i> ¿Ya tienes tu cuenta comercio? Ingresa aquí
                    </button></a>
                </div>
            </div>
        </section>
    </main>

</body>
</html>