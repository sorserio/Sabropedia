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
    <link rel="stylesheet" href="/css/reset.css">
	<title>Insert title here</title>
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
                <h2 class="loginMsg">Muéstrale al mundo tu negocio!</h2>
					<form:form action="/guardar" method="POST" modelAttribute="comercio" enctype="multipart/form-data">
					
	
				    <form:label path="nombreComercio">Nombre de tu negocio:</form:label>
				    <form:input type="text" path="nombreComercio"/>
				    <form:errors class="error" path="nombreComercio"/>
				    
				    <form:label path="descripcion">Descripción:</form:label>
				    <form:textarea path="descripcion"></form:textarea>
				    <form:errors class="error" path="descripcion"/>
				    
				    
				    <form:label path="direccion">Direccion:</form:label>
				    <form:textarea path="direccion"></form:textarea>
				    <form:errors class="error" path="direccion"/>
					
					<form:label path="imagenComercio">Imagen de portada:</form:label>
				    <input type="file" name="imagenComercioTransient"/>
				    <form:errors class="error" path="imagenComercio"/>
				
				    <form:label path="imagenLogo">Logo:</form:label>
				    <input type="file" name="imagenLogoTransient"/>
				    <form:errors class="error" path="imagenLogo"/>
				    
				    <form:label path="imagenesGaleria">Galería de fotos:</form:label>
				    <input type="file" name="imagenGaleriaTransient" multiple/>
				    <form:errors class="error" path="imagenesGaleria"/>
				
				    <form:label path="categoria">Categoría:</form:label>
				    <form:select path="categoria" multiple="true">
				        <c:forEach var="categoria" items="${categorias}">
				            <option value="${categoria.id}">${categoria.nombre}</option>
				        </c:forEach>
				    </form:select>
				    <form:errors class="error" path="categoria"/>
				
				    <input type="hidden" value="${idGerencial}" name="gerente"/>
				    <input type="submit" value="Agregar"/>
				</form:form>

		</div>
	</section>
	</main>

</body>
</html>