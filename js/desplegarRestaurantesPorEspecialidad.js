function desplegarRestaurantes(){
    let section = document.getElementById("restaurantesOcultos");

    if (section.style.display == "") {
        section.style.display = "none"
        document.getElementById("botones").querySelectorAll("a")[1].innerHTML = "Ver restaurantes en otras localidades";
    } else if (section.style.display = "none") {
        section.style.display = "";
        document.getElementById("botones").querySelectorAll("a")[1].innerHTML = "Cerrar restaurantes en otras ubicaciones";
    }


}
document.getElementById("botones").querySelectorAll("a")[1].addEventListener("click", desplegarRestaurantes);