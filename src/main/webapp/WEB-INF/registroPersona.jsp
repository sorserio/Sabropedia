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
    <link rel="stylesheet" href="css/registroPersona.css">

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
                <h2 class="loginMsg">Registro de personas</h2>
                <p id="rp-description">Registrate como persona te permitirá subir imágenes, dejar valoraciones o escribir reseñas.</p>
                  
                      <form:form method="post" modelAttribute="usuario" enctype="multipart/form-data" action="/procesa/registro">
        <form:label path="nombre">Nombre:</form:label>
        <form:input path="nombre" type="text" placeholder="Ingresa tu nombre"/>
        <form:errors class="error" path="nombre"/><br/>

        <form:label path="apellido">Apellido:</form:label>
		<form:input path="apellido" type="text" placeholder="Ingresa tu apellido"/>
		<form:errors class="error" path="apellido" /><br/>

		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text" placeholder="Ingresa tu email"/>
		<form:errors class="error" path="email" /><br/>

        <form:label path="contraseña">Contraseña:</form:label>
		<form:input path="contraseña" type="password" placeholder="Ingresa tu contraseña"/>
		<form:errors class="error" path="contraseña" /><br/>
					
		<form:label path="confirmarContraseña">Confirmar Contraseña:</form:label>
		<form:input path="confirmarContraseña" type="password" placeholder="Confirma tu contraseña"/>
		<form:errors class="error" path="confirmarContraseña"/><br/>

        <form:label path="perfil">Foto de Perfil:</form:label>
        <input type="file" name="imagenPerfil" id="imagenPerfil" /><br/>
		<form:errors class="error" path="perfil"/><br/>

        <button type="submit">Guardar</button>
    </form:form>
				<div class="sign-up">
                    <p>
                        <a href="/recuperar" class="reset">¿Olvidaste tu contraseña?</a>
                        <br><br>
                        Únete y forma parte de la comunidad con el mejor sazón.
                    </p>
                    <a href="/login"><button id="registroPersona">
                        <i class="fa-solid fa-user"></i> ¿Ya tienes cuenta? Ingresa aquí
                    </button></a>
                    <a href="/registroComercio"><button id="registroComercial">
                        <i class="fa-solid fa-shop"></i> Regístrate como Comercial
                    </button></a>
                </div>
	</div>
	</section>
</main>
</body>
</html>