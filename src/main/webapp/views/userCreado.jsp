<%-- 
    Document   : userCreado
    Created on : 21/12/2022, 21:35:11
    Author     : sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/homebanking/css/index.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Klee+One:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ultra&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>Usuario Creado</title>
    </head>
    <body style="background: lightsteelblue">
        
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
                    <a class="btn btn-primary inicio" style="display:<%= isLogin?"none":"initial" %>">Iniciar sesion</a>
                </div>
                <div class="out" style="position: absolute; top: 25%; right: 5%;">                
                    <a href="/homebanking/usuario/viewUser" class="btn btn-primary inicio" style="display:<%= !isLogin?"none":"initial" %>">Mi cuenta</a>
                    <a class="btn btn-primary inicio" href="/homebanking/usuario/logoutUser" style="display:<%= !isLogin?"none":"initial" %>">salir</a>
                </div>
            </nav>
        </header>
                <main class="d-flex flex-column justify-content-center align-items-center" style=" height:100%;">
            <h2 class="mb-3">Informacion de registro:</h2>
            
            <%
            int uCreado = (int) session.getAttribute("uCreado");
            switch (uCreado) {
                case 1:
                    %>
                    <h3 class="text-success">¡Registro exitoso!</h3>
                    <%
                    break;
                case 2:
                    %>
                    <h3 class="text-danger">¡El usuario ya existe!</h3>
                    <%
                    break;
                default:
                    %>
                    <h3 class="text-danger">¡Registro fallido!</h3>
                    <%
                    break;
            }
            %>
            
            <a href="/homebanking/" class="mt-3">Volver al INICIO</a>
            
        </main>
        <footer>
            <ul class="footer__ul">
                <li class="footer__li"><a href="/homebanking/contacto.html" target="_blank"> Horarios</a></li>
                <li class="footer__li"><a href="/homebanking/contacto.html" target="_blank"> Eventos</a></li>
                <li class="footer__li">únete a nosotros</li>
            </ul>
        </footer>
    </body>
</html>