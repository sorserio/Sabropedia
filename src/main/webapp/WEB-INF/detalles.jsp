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
    <link rel="stylesheet" href="/css/detalles.css">
    <script defer src="./detalles.js"></script>
    <title>Sabropedia</title>
</head>

<body>
    <header>
        <nav class="header-section">
            <img class="logo" src="./images/logo.png" alt="logo">
            <div class="nav-buttons">
                <ul>
                <li><a href="/inicio"><i class="fa-solid fa-house"></i><h5>INICIO</h5></a></li>
                <li><a href="/restaurantes"><i class="fa-solid fa-utensils"></i><h5>RESTAURANTES</h5></a></li>
                <li><a href="/heladerias"><i class="fa-solid fa-ice-cream"></i><h5>HELADERÍAS</h5></a></li>
                <li><a href="/cafeterias"><i class="fa-solid fa-mug-saucer"></i><h5>CAFETERÍAS</h5></a></li>
                <li><a href="/foodtrucks"><i class="fa-solid fa-truck"></i><h5>FOOD TRUCKS</h5></a></li>
                </ul>
            </div>
          <div class="profile-menu">
            	<c:if test="${fn:length(nombreCompleto) > 0}">
            	<c:forEach var="usuario" items="${usuarios}">
            	<c:forEach var="gerente" items="${gerentes}">
                        <button class="profile-menu-toggle">
	                        <c:if test="${usuario.id == idUsuario}">
								<a href="/perfil/${usuario.id}"><img src="${usuario.perfil}" alt="Foto de perfil" class="profile-menu"></a>
							</c:if>
							
						  	<span class="profile-menu">Mi perfil</span>
                    		<span class="profile-menu">▼</span>
                   		</button>
                   		<div class="profile-menu-options">
                    		<a href="/logout" class="profile-menu">Cerrar sesión</a>
                    		<a href="asistencia.html" class="profile-menu">Asistencia</a>
							<c:if test="${gerente.id == idGerencial}">
	                    		<c:if test="${gerente.comercio == null}">
									<a href="/form/agregar">Crea tu local</a>
								</c:if>
								<c:if test="${gerente.comercio != null}">
									<a href="/detalle/${gerente.comercio.id}">Mi local</a>
								</c:if>
							</c:if>
                   		</div>
				</c:forEach>
				</c:forEach>
				</c:if>
					<c:if test="${fn:length(nombreCompleto) == 0}">
					<button class="profile-menu-toggle">
					    <span class="join">
					        <a href="/">Únete!</a>
					    </span>
					</button>
				</c:if>
            </div>
        </nav>

    </header>
    <main class="card-section">
        <section class="local-details">
            <div class="card">
                <img class="local-img" src="${comercio.imagenComercio}" alt="Comida Mexicana">
                	<div class="logo-name-mark">
                    <div class="logo-name">
                        <img src="${comercio.imagenLogo}" alt="Logo del Restaurante" class="restaurant-logo">
                        	<div class="name-mark">
                            <h3>"${comercio.nombreComercio}"</h3>
                            <span class="mark"><i class="fa fa-star"></i> "${comercio.calificacionPromedio}"</span>
                        </div>
                        <c:forEach var="categoria" items="${comercio.categoria}">
                        <span class="cat">"${categoria.nombre}"</span>
                        </c:forEach>
                    </div>
                </div>
                <div class="local-info">
                    <div class="description">
                        <h4>Quienes somos</h4>
                        <p>"${comercio.descripcion}"</p>
                    </div>

                    <div class="address">
                        <h4>Dirección:</h4>
                        <p>"${comercio.direccion}"</p>
                    </div>

                    <div class="phone">
                        <h4>Teléfono:</h4>
                        <a href="tel:${comercio.gerente.telefono}">"${comercio.gerente.telefono}"</a>
                    </div>
                </div>
                <div class="image-gallery">
                    <h4 style="margin-left: 15px;">Galería de imágenes:</h4>
                    <div class="gallery">
                    <c:forEach var= "imagenGaleria" items="${comercio.imagenesGaleria}">
                        <img src="${imagenGaleria}" alt="Imagen galeria" class="gallery-img">
					</c:forEach>
                    </div>
                </div>
               <div class="add-review">
               
               <c:if test="${comerdio.gerente.id == idGerente}">
						<a href="/form/editar/${comercio.id}">Editar</a>
				</c:if>
    		<h4>Cuéntanos, ¿qué te pareció nuestro servicio?</h4>
    		<form:form action="/comentar" method="POST" modelAttribute="comentario" enctype="multipart/form-data" id="review-form">
    		<input type="hidden" name="comercio" value="${comercio.id}"/>
			<input type="hidden" value="${idUsuario}" name="creador" />
        <!-- Campo de texto para mensaje -->
        <form:textarea path="mensaje" id="review-comment" placeholder="Escribe tu reseña aquí..." class="form-control"></form:textarea>
        <form:errors class="error" path="mensaje"/>
        
        			<form:label path="imagenReseña">Sube una imagen de tu experiencia:</form:label>
				    <input type="file" name="imagen"/>
				    <form:errors class="error" path="imagenReseña"/>
        
        <!-- Sección de calificación -->
        	<div class="rating">
            <form:label path="calificacion">Calificación:</form:label>
				<form:select path="calificacion" class="form-control" id="rating">
				    <form:option value="">Selecciona</form:option>
				    <form:option value="1">1 estrella</form:option>
				    <form:option value="2">2 estrellas</form:option>
				    <form:option value="3">3 estrellas</form:option>
				    <form:option value="4">4 estrellas</form:option>
				    <form:option value="5">5 estrellas</form:option>
				</form:select>
				<form:errors class="error" path="calificacion" />
        </div>
        
        <!-- Botón de envío -->
        <button style="margin-top: 20px;" type="submit" class="submit-review">Enviar Reseña</button>
    </form:form>
</div>
                <div class="reviews">
                    <h4>Reseñas de los usuarios:</h4>
                    <div id="reviews-container">
							<c:forEach var="comentario" items="${comercio.comentarios}">
								<i>${comentario.creador.nombre} ${comentario.creador.apellido}</i>
								<p>${comentario.mensaje}</p>
								<img class="local-img" src="${comentario.imagenReseña}" alt="comida-mexicana">
								<br/>
							</c:forEach>
                    </div>
                </div>
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
            <p><a href="/politicas" class="politicas">Consulta nuestras políticas de privacidad y datos del usuario</a>
            </p>
        </div>
    </footer>
</body>

</html>