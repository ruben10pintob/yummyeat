let valor = document.getElementById("cantidad").value;

function enviarFormulario() {
    if (valor !== document.getElementById("cantidad").value){
        document.FormularioCantidades.submit();
    } else {

    }
}

document.getElementById("cantidad").addEventListener("click", enviarFormulario);



