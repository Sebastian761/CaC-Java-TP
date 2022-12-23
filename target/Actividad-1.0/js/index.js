const stockProductos = [
    {
        id: 1,
        nombre: "Ensalada mixta",
        cantidad: 1,
        desc: "Ligera y suave para los dias de verano.",
        precio: 1500,
        img: "../assets/js/ensalada-mixta.jpg",
    },
    {
        id: 2,
        nombre: "Tostadas con huevos escalfados",
        cantidad: 1,
        desc: "ideal para complementar tu desayuno.",
        precio: 1000,
        img: "../assets/js/tostada.jpg",
    },
    {
        id: 3,
        nombre: "Pizza vegetariana",
        cantidad: 1,
        desc: "Masa suave de coliflor y topping de brócoli.",
        precio: 1800,
        img: "../assets/js/p-vegetariana.jpg",
    },
    {
        id: 4,
        nombre: "Ensalada caprese",
        cantidad: 1,
        desc: "Refrescante acompañante para algún plato principal.",
        precio: 1100,
        img: "../assets/js/caprese.jpg",
    },
    {
        id: 5,
        nombre: "Pizaa mixta",
        cantidad: 1,
        desc: "buena opcion para experimentar distintos tipos de sabores en la misma pizza.",
        precio: 1700,
        img: "../assets/js/p-mixta.jpg",
    },
    {
        id: 6,
        nombre: "Pasta carbonara",
        cantidad: 1,
        desc: "Clásica pasta carbonara llevada a los más altos estándares.",
        precio: 1700,
        img: "../assets/js/carbonara.jpg",
    },
    {
        id: 7,
        nombre: "Limonada",
        cantidad: 1,
        desc: "Refrescante vaso de limonada.",
        precio: 600,
        img: "../assets/js/limonada.jpg",
    },
    {
        id: 8,
        nombre: "Pizza napolitana",
        cantidad: 1,
        desc: "la verdadera pizza napolitana con los sabores auténticos de italia.",
        precio: 1600,
        img: "../assets/js/p-napolitana.jpg",
    },
    {
        id: 9,
        nombre: "Mojito",
        cantidad: 1,
        desc: "Intenso, con un profundo sabor a menta.",
        precio: 700,
        img: "../assets/js/mojito.jpg",
    },
    {
        id: 10,
        nombre: "Ensalada cesar",
        cantidad: 1,
        desc: "Ensaldacesar con pollo y aderezo de la casa.",
        precio: 1400,
        img: "../assets/js/cesar.jpg",
    },
    {
        id: 11,
        nombre: "Pasta alfredo",
        cantidad: 1,
        desc: "Rigatoni con salsa alfredo y champiñones.",
        precio: 1600,
        img: "../assets/js/alfredo.jpg",
    },
]

let carrito = []

const carritoContenedor = document.querySelector('#carritoContenedor')
const contenedor = document.querySelector('#contenedor')
const vaciarCarrito = document.querySelector('#vaciarCarrito')
const precioTotal = document.querySelector('#precioTotal')
const procesarCompra = document.querySelector('#procesarCompra')
const activarFuncion = document.querySelector('#activarFuncion')
const totalProceso = document.querySelector('#totalProceso')
const formulario = document.querySelector('#procesar-pago')

if(activarFuncion){
    activarFuncion.addEventListener('click', procesarPedido)
}

if(formulario){
    formulario.addEventListener('submit', enviarPedido)
}

document.addEventListener("DOMContentLoaded", () => {
    carrito = JSON.parse(localStorage.getItem("carrito")) || []

    mostrarPedido()

    if(activarFuncion){
        document.querySelector("#activarFuncion").click(procesarPedido)
    }

})

if(vaciarCarrito){
    vaciarCarrito.addEventListener('click', () => {
        carrito.length = []
        mostrarPedido()
    })
}


if(procesarCompra){
    procesarCompra.addEventListener('click', ()  =>{
        if(carrito.length === 0){
            Swal.fire({
                title: "¡Tu carrito está vacio!",
                text: "Compra algo para continuar con la compra",
                icon: "error",
                confirmButtonText: "Aceptar",
            })
            } else {
                location.href = "pedido.html";
            }
        })
}

stockProductos.forEach((prod) => {
    const {id, nombre, precio, desc, img, cantidad} = prod
    if(contenedor){
        contenedor.innerHTML += `
        <div class="card col-3" id="eleccion">
            <img class="card-img-top mt-2 imagen" src="${img}" alt="Card image cap">
            <div class="card-body datos">
                <h5 class="card-title titulo__card">${nombre}</h5>
                <p class="card-text"><b>Precio:</b> ${precio}</p>
                <p class="card-text"><b>Descripcion:</b> ${desc}</p>
                <p class="card-text"><b>Cantidad:</b> ${cantidad}</p>
                <button class="btn btn-primary" id="boton__card" onclick="añadirPedido(${id})">Añadir al pedido</button>
            </div>
        </div>
            `;
    }
})

function añadirPedido(id){

    const existe = carrito.some(prod => prod.id === id)

    if(existe){
        const prod = carrito.map(prod => {
            if(prod.id === id){
                prod.cantidad++
            }
        })
    } else {
        const item = stockProductos.find((prod) => prod.id === id)
        carrito.push(item)
    }
    mostrarPedido()
}

const mostrarPedido = () => {
    const modalBody = document.querySelector('.modal .modal-body')
    if(modalBody){
        modalBody.innerHTML = ''
    carrito.forEach((prod) => {
        const{id, nombre, img, desc, cantidad, precio} = prod
        modalBody.innerHTML +=  `
        <div class="modal-contenedor">
            <div>
                <img class="img-fluid img-carrito" src="${img}"/>
            </div>
            <section>
                <p><b>Nombre:</b> ${nombre}</p>
                <p><b>Precio:</b> ${precio}</p>
                <p><b>Cantidad:</b> ${cantidad}</p>
                <button class="btn btn-danger"  onclick="eliminarProducto(${id})">Eliminar producto</button>
            </section>
        </div>
        `
    })
}
    
    if(modalBody){
        if(carrito.length === 0){
            modalBody.innerHTML = `
                <p class="texto">¡Aún no agregaste nada al pedido!</p>
            `
        }
    }
    
    carritoContenedor.textContent = carrito.length 


    if(precioTotal){
        precioTotal.innerText = carrito.reduce((acc, prod) => acc + prod.cantidad * prod.precio, 0)
    }

    guardarStorage()
}

function eliminarProducto(id){
    const comidaId = id
    carrito =carrito.filter((comida) => comida.id !== comidaId)
    mostrarPedido()
}

function guardarStorage(){
    localStorage.setItem("carrito", JSON.stringify(carrito));
}

function procesarPedido(){
    carrito.forEach((prod) => {
        const listaPedido = document.querySelector('#listaPedido')
        const{id, nombre, precio, cantidad, img} = prod

        const row = document.createElement('tr')
        row.innerHTML += `
        <td>
            <img class="img-fluid img-carrito" src="${img}"/>
            </td>
            <td>${nombre}</td>
            <td>${precio}</td>
            <td>${cantidad}</td>
            <td>${precio * cantidad}</td>
        `
        listaPedido.appendChild(row)
    })

    totalProceso.innerText = carrito.reduce((acc, prod) => acc + prod.cantidad * prod.precio, 0)
}

function enviarPedido(e){
    e.preventDefault()
    const cliente = document.querySelector('#cliente').value
    const correo = document.querySelector('#correo').value
    if(correo === '' || cliente == ''){
        Swal.fire({
            title: "¡Debes completar tu email y nombre!",
            text: "Rellena el formulario",
            icon: "error",
            confirmButtonText: "Aceptar",
        })
    }else{
        const spinner = document.querySelector('#spinner')
        spinner.classList.add('d-flex')
        spinner.classList.remove('d-none')

        setTimeout(() => {
            spinner.classList.remove('d-flex')
            spinner.classList.add('d-none')
            formulario.reset()

        const alertExito = document.createElement('h5')
        alertExito.classList.add('alert', 'alerta', 'alert-success')
        alertExito.textContent = 'Compra realizada correctamente'
        formulario.appendChild(alertExito)

        setTimeout(() => {
            alertExito.remove()
        }, 3000)

    }, 3000)
}
    localStorage.clear()

}
