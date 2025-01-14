<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>
        Mi cuenta
    </title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/perfil.css">
    <style>

    </style>
</head>

<body>
    <div class="container">
        <div class="sidebar">
            <img src="${usuario.perfil}"  height="100" width="100"  alt="Profile picture of the user"/>
            <ul>
                <li>
                    <a href="#"><i class="fas fa-home"></i>Inicio</a>
                </li>
                <li>
                    <a href="#"><i class="fas fa-map-marker-alt"></i>Mis direcciones
                    </a>
                </li>
                <li>
                    <a href="#"><i class="fas fa-heart"></i>Mis favoritos</a>
                </li>
                <li>
                    <a href="#"><i class="fas fa-box"></i>Mis pedidos</a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-headset"></i>Ayuda en línea</a>
                </li>
                <li><a style="border:1px solid black; border-radius: 10px; width: 20%; padding: 4px; display: flex; justify-content: center;"
                        href="/inicio">Volver</a></li>
            </ul>
        </div>
        <div class="content">
            <h1 style="color: white;">Mi cuenta</h1>
            <div class="section">
                <h2>Información personal</h2>
                <ul>
                    <li>
                        <a><i class="fas fa-user"></i>Nombre: ${usuario.nombre} ${usuario.apellido}</a>
                    </li>
                    <li>
                        <a>Correo: ${usuario.email}</a>
                    </li>
                    <li>
                        <a href="/recuperar">Cambiar contraseña</a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</body>

</html>