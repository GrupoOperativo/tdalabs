<%-- 
    Document   : registro
    Created on : 23 may 2023, 14:26:27
    Author     : alumno
--%>

<%@page import="datos.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro Denario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script >
            var i = 0;
            window.addEventListener("load", function(){
                    document.getElementById("altas").addEventListener("submit", function(event){
                        validar();
                        if (i === 0){
                            event.preventDefault();
                        }
                    });
                });
            function togglePasswordVisibility(inputId) {
                var passwordInput = document.getElementById(inputId);
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                } else {
                    passwordInput.type = "password";
                }
            }    
            function validar(){ 
                
                var nombre = document.getElementById('nombre').value;
                var nom = document.getElementById('nombre');
                var correo = document.getElementById('correo').value;
                var corr = document.getElementById('correo');
                var pass1 = document.getElementById('pass1').value;
                var passs1 = document.getElementById('pass1');
                var pass2 = document.getElementById('pass2').value;
                var passs2 = document.getElementById('pass2');
                var label = document.getElementById('aviso');
                var btn = document.getElementById('registrar');
                var longitud = nombre.length;
                var correoExp = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                i = 0;
                if (nombre === ''){
                    label.textContent="Ingresa tu nombre";
                    nom.focus();
                }
                else if(longitud > 15 || longitud < 5){
                    label.textContent="Ingresa un nombre de usuario de entre 5 y 15 caracteres";
                    nom.focus();
                }
                else if(correo === ''){
                    label.textContent="Ingresa tu correo electrónico";
                    corr.focus();
                }
                else if (!correoExp.test(correo)){
                    label.textContent="El correo no es válido";
                    corr.focus();
                }
                else if (pass1.length < 8) {
                    label.textContent="La contraseña debe tener más de 8 caracteres";
                    passs1.focus();
                }
                else if(pass1 === ''){
                    label.textContent="Ingresa tu contraseña";
                    passs1.focus();
                }
                else if(pass2 === ''){
                    label.textContent="Confirma tu contraseña";
                    passs2.focus();
                }
                else if(pass2 !== pass1){
                    label.textContent="Las contraseñas no coinciden";
                    passs2.value = "";
                    passs2.focus();
                }
                else{
                    i = 1;
                    }
        }
        
            function regresar(){
                window.location.replace('logIn.jsp');
            }
            
            
        </script>

        <link rel="stylesheet" href="assets/css/registro.css">
    </head>
    <body >
            <div class="cabecera">
                <h1>Crear cuenta</h1>
            </div>
        <div class="formulario">
            <img src="assets/img/chemeia.png" height="70" alt="Chemeia">
            <form name="altas" action="altasUsuario.jsp" method="post" id="altas">
                <div class="username">
                    <input type="text" required id="nombre" name="nombre" autofocus>
                    <label>Usuario</label>
                </div>
                <div class="username">
                    <input type="text" required id="correo" name="correo">
                    <label>Correo electrónico</label>
                </div>
                <div class="username">
                  <input type="password" required id="pass1" name="contrasenia">
                  <label for="pass1">Contraseña</label>
                  <span class="icono-ojo" onclick="togglePasswordVisibility('pass1')">&#128065;</span>
                </div>
                <div class="username">
                  <input type="password" required id="pass2" name="confirmarContrasenia">
                  <label for="pass2">Confirma contraseña</label>
                  <span class="icono-ojo" onclick="togglePasswordVisibility('pass2')">&#128065;</span>
                </div>
                <div class="la">
                    <label id="aviso" class="lable"></label>
                </div>
                <br>
                <input type="submit" value="Registrate" onmouseover="validar()" id="registrar">
            </form>
        </div> 
        <div class="pie">
            <input type="submit" value="Regresar" onclick="regresar()" id="regresar" >
        </div>  
    </body>
</html>