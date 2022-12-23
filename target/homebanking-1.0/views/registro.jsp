<%-- 
    Document   : index
    Created on : 13/07/2022, 12:21:57
    Author     : jose
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/homebanking/css/index.css"/>
        <link rel="stylesheet" href="/homebanking/css/registro.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Klee+One:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ultra&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>Resgistrate</title>
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
                <a class="btn btn-primary inicio" href="/homebanking/views/login.jsp" target="_blank" style="display: <%= isLogin?"none":"initial" %>">Iniciar sesion</a>
            </div>
            <div class="out" style="position: absolute; top: 25%; right: 5%;">                
                <button type="button" class="btn btn-primary inicio" style="display: <%= !isLogin?"none":"initial" %>">Mi cuenta</button>
                <button type="button" class="btn btn-primary inicio" style="display: <%= !isLogin?"none":"initial" %>">salir</button>
            </div>
        </nav>
    </header>
        
    <%
        if ((boolean)session.getAttribute("isLogin")){
          response.sendRedirect("/");
        }  
    %>

    <main class="container d-flex justify-content-center align-items-center">
            <form action="/usuario/createUser" style="margin-top: 15em;">
                <div class="mb-3">
                  <label for="username" class="form-label">Usuario:</label>
                  <input type="text" class="form-control" id="username" placeholder="Ingrese su usuario" name="user">
                </div>
                <div class="mb-3">
                  <label for="pwd" class="form-label">Contraseña:</label>
                  <input type="password" class="form-control" id="pwd" placeholder="Ingrese su contraseña" name="pswd">
                </div>
                 <div class="mb-3">
                  <label for="nombre" class="form-label">Nombre:</label>
                  <input type="text" class="form-control" id="nombre" placeholder="Ingrese su nombre" name="nombre">
                </div>
                <div class="mb-3">
                  <label for="apellido" class="form-label">Apellido:</label>
                  <input type="text" class="form-control" id="apellido" placeholder="Ingrese su apellido" name="apellido">
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email:</label>
                  <input type="email" class="form-control" id="email" placeholder="Ingrese su correo" name="email">
                </div>
                <div class="form-check mb-3">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember"> Recordarme
                  </label>
                </div>
                <div class="row p-4 justify-content-between">
                    <div class="col-auto">
                        <button class="btn btn-dark" type="submit">Registrar</button>
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
    
    <script src="https://kit.fontawesome.com/5c677af5fc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>


