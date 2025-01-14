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
										<a href="/form/agregar">CREA TU LOCAL</a>
									</c:if>
									<c:if test="${gerente.comercio != null}">
										<a href="/form/editar/${gerente.comercio.id}">EDITA TU LOCAL</a>
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
    <div class="nav-bar">
        <div class="slogan">Qué mejor que ir a probar un buen Food Truck...</div>
        <div class="nav-buttons">
            <ul>
                <li><a href="/inicio"><i class="fa-solid fa-house"></i><h5>INICIO</h5></a></li>
                <li><a href="/restaurantes"><i class="fa-solid fa-utensils"></i><h5>RESTAURANTES</h5></a></li>
                <li><a href="/heladerias"><i class="fa-solid fa-ice-cream"></i><h5>HELADERÍAS</h5></a></li>
                <li><a href="/cafeterias"><i class="fa-solid fa-mug-saucer"></i><h5>CAFETERÍAS</h5></a></li>
                <li><a href="/foodtrucks"><i class="fa-solid fa-truck"></i><h5>FOOD TRUCKS</h5></a></li>
            </ul>
        </div>
    </div>
    <main class="bodyCards">
        <section class="column">
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/mrfrench.png" alt="imagen de papas fritas">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/mrfrench.png" alt="logo de Mr. French Fries">
                            <h3>Mr. French Fries</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.7</span>
                        </div>
                    </div>
                </div>
            </a>
            <a href="/perfilLocal2" class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/elbajon.png" alt="portada de buen bajón">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/buenbajon.png" alt="logo buen bajón">
                            <h3>Buen Bajón</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 4.1</span>
                        </div>
                    </div>
                </div>
            </a>
            <a  class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/gypsy.png" alt="Food truck estación 62">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/gypsy.png" alt="logo de estación 62">
                            <h3>Gypsy Kitchen</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 3.9</span>
                        </div>
                    </div>
                </div>
            </a>
        </section>
        <section class="column">
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/fritas.png" alt="sopaipillas">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/fritas.png" alt="logo de fritas food truck">
                            <h3>Fritas Food Truck</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 3.9</span>
                        </div>
                    </div>
                </div>
            </a>
            <a  class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/churros-truck.png" alt="ramo de churros">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/churros-truck.png" alt="logo de churros truck">
                            <h3>Churros Truck</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 3.9</span>
                        </div>
                    </div>
                </div>
            </a>
            <a class="card-link">
                <div class="card">
                    <img class="local-img" src="./images/local/burger-world.png" alt="hamburgesa">
                    <div class="category">
                        <span class="cat">FOOD TRUCK</span>
                    </div>
                    <div class="logo-name-mark">
                        <div class="logo-name">
                            <img src="./images/logo/burger-world.png" alt="logo de burger world">
                            <h3>Burger World</h3>
                        </div>
                        <div class="mark">
                            <span><i class="fa fa-star"></i> 3.9</span>
                        </div>
                    </div>
                </div>
            </a>
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
            <p><a href="/politicas" class="politicas">Consulta nuestras políticas de privacidad y datos del usuario</a></p>
        </div>
    </footer>
</body>
</html>