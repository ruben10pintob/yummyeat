let valor = document.getElementById("cantidad").value;

function enviarFormulario() {
    var anexo =  document.getElementById("cantidad").value;
    if (valor !== anexo){
        document.FormularioCantidades.submit();
    }
}

document.getElementById("cantidad").addEventListener("click", enviarFormulario);
