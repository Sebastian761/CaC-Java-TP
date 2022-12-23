<%-- 
    Document   : index
    Created on : 18/12/2022, 19:17:34
    Author     : sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CaC - TP Final</title>
        <link rel="stylesheet" href="/homebanking/css/index.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Klee+One:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ultra&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
<body>
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
                <a class="btn btn-primary inicio" style="display:<%= isLogin?"none":"initial" %>" href="/homebanking/views/login.jsp" target="_blank">Iniciar sesion</a>
            </div>
            <div class="out" style="position: absolute; top: 25%; right: 5%;">                
                <button type="button" class="btn btn-primary inicio" style="display:<%= !isLogin?"none":"initial" %>">Mi cuenta</button>
                <button type="button" class="btn btn-primary inicio" style="display:<%= !isLogin?"none":"initial" %>">salir</button>
            </div>
        </nav>
    </header>
    <main>
        <section>
            <div class="imagen_fondo">
                <a id="inicio"></a>
                <div>                
                    <p class="titulo">"Un restaurante que fomenta las relacionas y alimenta corazones"</p>
                </div>
            </div>
        </section>
        <section class="row info__row">
            <div class="col-4">
                <img src="/homebanking/assets/index/spaguetti.png" alt="pasta">
                <h2>Pastas</h2>
                <p>Traemos el sabor tradicional de Italia a tu mesa.</p>
                <a href="./menu.html"><button type="button" class="btn btn-primary pedido">Pedir ahora</button></a>
            </div>
            <div class="col-4">
                <img src="/homebanking/assets/index/ensalada.png" alt="ensalada">
                <h2>Ensaladas</h2>
                <p>Ligeras, sabrosas y refrescantes.</p>
                <a href="./menu.html"><button type="button" class="btn btn-primary pedido">Pedir ahora</button></a>
            </div>
            <div class="col-4">
                <img src="/homebanking/assets/index/mojito.png" alt="bebida">
                <h2>Bebidas</h2>
                <p>Las bebidas no pasan de moda, <br> ven y disfruta de nuestra variedad.</p>
                <a href="/homebanking/menu.html"><button type="button" class="btn btn-primary pedido bajo">Pedir ahora</button></a>
            </div>
            <a id="somos"></a>
        </section>
        <section>
            <div class="historia">
                <div class="texto">
                    <h2>Nuestra historia</h2>
                    <p class="lema">~ Crecimos con una cocina sencilla, buena y honesta ~ <br></p>
                    <p>Estos grandes portadores de sabor no deben olvidarse.
                        Con orgullo, ambición y amor por la cocina,
                        nos gustaría inspirarte en la mesa durante muchos años más.
                        Hemos perfeccionado nuestras tecinas de cocina y platos con el tiempo,
                        ofreciendo así una verdadera experiencia no sólo en lo gastronómico sino tambien en lo personal.
                    </p>
                </div>
            </div>
        </section>
        <section class="row">
            <div class="col-6">
                <div class="pedir">
                    <img src="/homebanking/assets/index/delivery-man.png" alt="icon" class="icon">
                    <p>Haz tu pedido Online</p>
                    <h2 class="frase">¡Vamos a donde tú estes!</h2>
                    <button type="button" class="btn btn-primary pedido">Pedir ahora</button>
                </div>
            </div>
            <div class="col-6 reservar">
                <div class="linea-container"><div class="linea"></div></div>
                <div><div class="linea-horizontal"></div></div>
                <div>
                    <div class="info">
                        <p>Reserva</p>
                        <h2 class="reserva">Con anticipación</h2>
                    </div>
                    <form action="" class="formulario">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Cantidad de personas</option>
                            <option value="1">1 persona</option>
                            <option value="2">2 personas</option>
                            <option value="3">3 personas</option>
                            <option value="3">4 personas</option>
                        </select>
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Horario</option>
                            <option value="1">13:00</option>
                            <option value="2">17:00</option>
                            <option value="3">19:00</option>    
                            <option value="3">21:00</option>
                        </select>
                        <input type="date" placeholder="Fecha">
                    </form>
                    <button type="button" class="btn btn-primary pide">Reservar ahora</button>
                </div>
            </div>
        </section>
        <section class="gallery">
            <h3>Te ofrecemos en nuestro menú</h3>
            <div class="gallery_container">
                <figure>
                    <img src="/homebanking/assets/index/plato-4.jpg" alt="plato">
                    <div class="capa">
                        <h4>Ensalada mixta</h4>
                        <p> La ensalada de la casa por excelencia, protagonista indiscutible de los menús de los dias veraniegos.</p>
                    </div>
                </figure>
                <figure>
                    <img src="/homebanking/assets/index/plato-3.jpg" alt="plato">
                    <div class="capa">
                        <h4>Pizza margarita</h4>
                        <p>Ideal para compartir en familia.</p>
                    </div>
                </figure>
                <figure>
                    <img src="/homebanking/assets/index/plato-1.jpg" alt="plato">
                    <div class="capa">
                        <h4>Huevos al horno</h4>
                        <p>Excelente elección para desayunar.</p>
                    </div>
                </figure>
                <figure>
                    <img src="/homebanking/assets/index/plato-2.jpg" alt="plato">
                    <div class="capa">
                        <h4>Variedad de bebidas</h4>
                        <p>Contamos con una amplia variedad de bedidas de tu preferencia.</p>
                    </div>
                </figure>
                <figure>
                    <img src="/homebanking/assets/index/plato-5.jpg" alt="plato">
                    <div class="capa">
                        <h4>Ñoquis al pesto</h4>
                        <p>Sencillo y único como lo tradicional.</p>
                    </div>
                </figure>

            </div>
        </section>
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
