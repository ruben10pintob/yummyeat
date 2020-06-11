function enviarFormulario() {
    document.form1.submit();
}
document.getElementsByName("cantidad")[0].addEventListener("click", enviarFormulario);