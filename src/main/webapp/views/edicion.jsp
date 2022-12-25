<%-- 
    Document   : edicion
    Created on : 22/12/2022, 19:33:06
    Author     : sebastian
--%>

<%@page import="model.Usuario"%>
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
        <title>Modificar Usuario </title>
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

        <%
            if (!(boolean)session.getAttribute("isLogin")){
                response.sendRedirect("/homebanking/");
            }

            Usuario actualUser = (Usuario) session.getAttribute("actualUser");
            String username = actualUser.getUsername();
            String password = actualUser.getPassword();
            String name = actualUser.getName();
            String last_name = actualUser.getLast_name();
            String email = actualUser.getEmail();
        %>
        
        <main style="height:100%" class="d-flex align-items-center flex-column">
            <form method="POST" action="/homebanking/usuario/updateUser" style="position:relative; top:15%; width: 50%">
                <h2 class="mb-4 text-center">Mi cuenta</h2>
                <div class=" mb-3">
                    <label for="username" class="form-label">Usuario:</label>
                    <input type="text" id="username" name="username" class=" form-control" value="<%= username%>" disabled>
                </div>

                <div class=" mb-3">
                    <label for="password" class=" form-label">Clave:</label>
                    <input type="password" id="password" name="password" class=" form-control" value="<%= password%>" >
                </div>

                <div class=" mb-3">
                    <label for="name" class=" form-label">Nombre:</label>
                    <input type="text" id="name" name="name" class=" form-control" value="<%= name%>" >
                </div>

                <div class="mb-3">
                    <label for="last_name" class="form-label">Apellido:</label>
                    <input type="text" id="last_name" name="last_name" class=" form-control" value="<%= last_name%>" >
                </div>

                <div class=" mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="col-8 form-control" value="<%= email%>" >
                </div>

                <div class="d-flex align-items-center justify-content-between">
                    <div class="col-auto">
                        <button class="btn btn-dark" type="submit">Modificar</button>
                    </div>
                    <div class="col-auto">
                        <a href="/homebanking/usuario/deleteUser" class="btn btn-danger">Eliminar</a>
                    </div>
                    <div class="col-auto">
                        <a href="/homebanking" class="link-primary">Inicio</a>
                    </div>
                </div>
            </form>
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