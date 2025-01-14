<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS + Dependencias (jQuery y Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/perfilLocal2.css">
    <script defer src="./detalle.js"></script>
</head>
<body>
    <header>

    
    <nav class="navegador">
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

    <main class="main-container">
        <aside class="aside-info">
          <img class="logo-banner" src="./images/logo/buenbajon.png">
          <p class="texto1">Buen Bajón</p>
            <p class="texto2">¿Tienes hambre y buscas algo rápido y delicioso? Buen Bajón es el lugar para ti. Nuestro food truck ofrece los mejores completos y papas fritas de la ciudad, preparados con ingredientes frescos y mucho sabor. 
              Perfecto para esas noches de antojos o después de una buena junta con amigos.</p>
        </aside>
        <section class="container-local">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="./images/carrusel/completo1.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./images/carrusel/papitas2.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./images/carrusel/papapleto3.png" class="d-block w-100" alt="...">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            <article class="container-info">
                <span class="contacto">
                    <p>¡Encuéntranos en Avenida Paicaví 321, Concepción, Chile </p>
                    <p>Horarios de atención:</p>
                    <ul style="list-style-type: disc; padding-left: 20px;">
                      <li>Lunes a viernes: 13:00 - 00:00</li>
                      <li>Sábados y domingos: 12:00 - 00:00 </li>
                    </ul>
                    <p>FONO: +56 (41) 321 1234</p>
                </span>
                <span class="reseñas"><section style="color: #ffffff; background-color: #FF6400; border-radius: 12px;">
                    <div class="container py-5 text-center">
                      <div class="row">
                        <!-- Testimonial Card -->
                        <div class="col-md-4">
                          <div class="card">
                            <div class="card-body">
                              <img src="images/reviews/completo1.png" class="img-reseña"  height="100" />
                              <h5>Matias Sobarzo 4.7</h5>
                              <p><i class="fas fa-quote-left pe-2"></i>Todo súper rico, nada que decir, un 7</p>
                            </div>
                          </div>
                        </div>
                  
                        <!-- Duplicate the card structure for additional testimonials -->
                        <div class="col-md-4">
                          <div class="card">
                            <div class="card-body">
                              <img src="images/reviews/completos2.png" class="img-reseña"  height="100" />
                              <h5>Simón Martinez 5.0</h5>
                              <p><i class="fas fa-quote-left pe-2"></i>Los mejores completos de todo Conce, ideal para disfrutar una rica once con amigos.</p>
                  
                            </div>
                          </div>
                        </div>
                  
                        <div class="col-md-4">
                          <div class="card">
                            <div class="card-body">
                              <img src="images/reviews/completos3.png" class="img-reseña" height="100" />
                              <h5>Alexa Horwitz 4.7</h5>

                              <p><i class="fas fa-quote-left pe-2"></i>Todos los días paso en mi horario de colación, muy buena atención.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex justify-content-center">
                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reviewModal">
                        Enviar una reseña
                      </button>
                    </div>
                  </section>
                  </span>
            </article>
            <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="reviewModalLabel">Enviar una reseña</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form>
                      <div class="modal-body">
                        <div class="form-group">
                          <label for="name">Nombre</label>
                          <input type="text" class="form-control" id="name" placeholder="Ingresa tu nombre" required>
                        </div>
                        <div class="form-group">
                          <label for="rating">Calificación</label>
                          <select class="form-control" id="rating" required>
                            <option value="">Selecciona</option>
                            <option value="1">1 estrella</option>
                            <option value="2">2 estrellas</option>
                            <option value="3">3 estrellas</option>
                            <option value="4">4 estrellas</option>
                            <option value="5">5 estrellas</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="review">Reseña</label>
                          <textarea class="form-control" id="review" rows="3" placeholder="Escribe tu reseña aquí" required></textarea>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            
              <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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