<%-- 
    Document   : usuario
    Created on : 19/12/2022, 01:59:17
    Author     : sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/homebanking/css/user.css"/>
        <link rel="stylesheet" href="/homebanking/css/index.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Klee+One:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ultra&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>User </title>
    </head>
    <body style=" background: lightsteelblue;">
        <header>
        <nav>
            <img class="logo" src="/homebanking/assets/index/comida.png" alt="icono_plato">
            <%
                boolean isLogin;
                if(session.isNew()){
                    session.setAttribute("isLogin", false); 
                }
                isLogin = (boolean) session.getAttribute("isLogin");
            %>
            <ul class="nav__ul">
                <li class="nav__li"><a href="#inicio">Inicio</a></li>
                <li class="nav__li"><a href="#somos">Quienes  somos</a></li>
                <li class="nav__li"><a href="/homebanking/views/contacto.html" target="_blank">Contactanos</a></li>
                <li class="nav__li"><a href="/homebanking/views/menu.html" target="_blank">Menú </a></li>
            </ul>
            <div class="log-on">                
                <a href="/homebanking/views/login.jsp" class="btn btn-primary inicio" style="display:<%= isLogin?"none":"initial" %>">Iniciar sesion</a>
            </div>
            <div class="out" style="position: absolute; top: 25%; right: 5%;">                
                <a href="/homebanking/usuario/viewUser" class="btn btn-primary inicio" style="display:<%= !isLogin?"none":"initial" %>">Mi cuenta</a>
                <a class="btn btn-primary inicio" href="/homebanking/usuario/logoutUser" style="display:<%= !isLogin?"none":"initial" %>">salir</a>
            </div>
        </nav>
    </header>
        
        <main class="d-flex flex-column align-items-center position-absolute top-50 estado ">
            <h2 class="mb-3">Informacion de ingreso:</h2>

            <%
                isLogin = (boolean) session.getAttribute("isLogin");
                if (isLogin) {
            %>
                <h3 class="text-success ">Acceso permitido</h3>
                <h3>¡Bienvenido!</h3>
            <%
            }
            else {
            %>
                <h3 class="text-danger">Acceso denegado</h3>

            <%
            } 
            %>
            <a href="/homebanking/" class="mt-3">Volver al INICIO</a>

        </main></body>
</html>