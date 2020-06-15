
var prueba = document.getElementById("tabla").querySelectorAll("#cantidad");

function enviarFormulario(p) {

        let anexo =  document.getElementById("tabla").querySelectorAll("#cantidad");
        if (p !== anexo) {
            document.getElementsByName("FormularioCantidades")[i].submit();
        }
}


for (var i = 0; i < prueba.length; i++) {

    let p = prueba[i].value;
    prueba[i].addEventListener('click', function () {enviarFormulario(p);});
}

function f(valor) {
    alert(valor);
}

//if (document.getElementsByName("cantidad")[0].addEventListener("click", enviarFormulario)) {
//}

/*for (var i = 0; i < inputs; i++) {
    document.getElementsByName("cantidad")[i].addEventListener("click", enviarFormulario);// cualquier input de cantidades que salga en el carrito
}*/



