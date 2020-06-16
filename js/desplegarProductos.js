function f(id) {

    let productos = document.getElementsByName(id);


    for (let i = 0; i < productos.length; i++) {

        if (productos[i].style.display == "") {
            productos[i].style.display = "none";

        } else {
            productos[i].style.display = "";
        }

    }

}

let iconos = document.getElementById("tabla").querySelectorAll("ion-icon");

for (var i = 0; i < iconos.length; i++) {
    let id = iconos[i].id;
    iconos[i].addEventListener('click', function () {f(id);});
}
