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
    <link rel="stylesheet" href="css/index.css">
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
						        <a href="/perfil/${usuario.id}">
						            <img src="${usuario.perfil}" alt="Foto de perfil" class="profile-image">
						        </a>
						    </c:if>
						    <span class="profile-text">Mi perfil</span>
						    <span class="profile-arrow">▼</span>
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
                <li><a href="/restaurantes"><i class="fa-solid fa-utensils"></i><h5>RESTAURANTES</h5></a></li>
                <li><a href="/heladerias"><i class="fa-solid fa-ice-cream"></i><h5>HELADERÍAS</h5></a></li>
                <li><a href="/cafeterias"><i class="fa-solid fa-mug-saucer"></i><h5>CAFETERÍAS</h5></a></li>
                <li><a href="/foodtrucks"><i class="fa-solid fa-truck"></i><h5>FOOD TRUCKS</h5></a></li>>
            </ul>
        </div>
    </nav>
    
		<main class="bodyCards">
        <section class="column">
            <a href="/perfilLocal" class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/wonder-pizza.png" alt="comida-mexicana">
                    <div class="category">
                        <span class="cat">RESTAURANTE</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/wonder.png" alt="orden-tacos">
                            <h3>Wonder Pizza</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 5</span>
                        </div>
                    </div>
                </div>
            </a>
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/casa-helado.png" alt="comida-mexicana">
                    <div class="category">
                        <span class="cat">HELADERÍA</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/casa-helado.png" alt="orden-tacos">
                            <h3>La Casa del Helado</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.8</span>
                        </div>
                    </div>
                </div>
            </a>
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/delicias-altamar.png" alt="comida-mexicana">
                    <div class="category">
                        <span class="cat">RESTAURANTE</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/delicias-altamar.png" alt="orden-tacos">
                            <h3>Delicias de Altamar</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.8</span>
                        </div>
                    </div>
                </div>
            </a>
        </section>
        <section class="column">
            <a  class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/estacion62.png" alt="Food truck estación 62">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/estacion62.png" alt="logo de estación 62">
                            <h3>Estación 62</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.7</span>
                        </div>
                    </div>
                </div>
            </a>
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/sanjorge.png" alt="comida-mexicana">
                    <div class="category">
                        <span class="cat">CAFETERÍA</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/sanjorge.png" alt="orden-tacos">
                            <h3>San Jorge Cafeterías</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.5</span>
                        </div>
                    </div>
                </div>
            </a>
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/heladeria-donpedro.png" alt="comida-mexicana">
                    <div class="category">
                        <span class="cat">HELADERÍA</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/DONPEDRO.png" alt="orden-tacos">
                            <h3>Heladería Don Pedro</h3><i class="fa-solid fa-circle-check"></i>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.4</span>
                        </div>
                    </div>
                </div>
            </a>
        </section>
    </main>
	
		    
    <main class="bodyCards">
        <section class="column">
        <c:forEach var= "comercio" items="${comercios}">
            <a href="/detalle/${comercio.id}" class="card-link">
                <div class="card">
                    <img class="local-img" src="${comercio.imagenComercio}" alt="comida-mexicana">
                    <div class="category">
                        <c:forEach var="categoria" items="${comercio.categoria}">
                        <span class="cat">${categoria.nombre}</span>
                        </c:forEach>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="${comercio.imagenLogo}" alt="orden-tacos">
                            <h3>"${comercio.nombreComercio}"</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i>${comercio.calificacionPromedio}</span>
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