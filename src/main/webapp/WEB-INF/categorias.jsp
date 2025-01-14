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
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/index.css">
<title>Sabropedia</title>
</head>
<body>
<header>
        <div class="navegador">
            <img class="logo" src="./images/logo.png" alt="logo">
            <div class="search-container">
                <input type="text" placeholder="Qué comemos hoy? ..." class="search-input">
                <button class="search-button">&#128269;</button>
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
        </div>
    </header>
        <nav class="nav-bar">
        <div class="slogan">Donde el saber y el sabor se encuentran.</div>
        <div class="nav-buttons">
            <ul> 
                <li><a href="/inicio"><i class="fa-solid fa-house"></i><h5>INICIO</h5></a></li>
                <c:forEach var="categoria"  items="${categorias}">
	                <li><a href="/categorias/${categoria.id}"><i class="fa-solid fa-utensils"></i><h5>${categoria.nombre}</h5></a></li>
                </c:forEach>
            </ul>
        </div>
    </nav>
    
		<main class="bodyCards">
    <section class="column">
        <c:forEach var="comercio" items="${comercios}">
            <a href="/detalle/${comercio.id}" class="card-link">
                <div class="card">
                    <img class="local-img" src="${comercio.imagenComercio}" alt="${comercio.nombreComercio}">
                    <div class="category">
                        <c:forEach var="categoria" items="${comercio.categoria}">
                            <span class="cat">${categoria.nombre}</span>
                        </c:forEach>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="${comercio.imagenLogo}" alt="Logo de ${comercio.nombreComercio}">
                            <h3>${comercio.nombreComercio}</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> ${comercio.calificacionPromedio}</span>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
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
            <p><a href="/politicas.html" class="politicas">Consulta nuestras políticas de privacidad y datos del usuario</a></p>
        </div>
    </footer>
</body>
</html>