<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=divice-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Inicio</title>
</head>
<body bgcolor="aqua">
<%

	HttpSession sesionOk=request.getSession();
	String usuario=(String) sesionOk.getAttribute("NIC");
	if (usuario==null){
		 response.sendRedirect("login.jsp");
	}	
%>

<div class="main-content  fondo_hal cover">
	<header class="h50 cblanco col11 mauto header ">
		<h1 class="font2  col6  h50 flef ">
			<p class="titulo   mauto">
				categoria
			</p>
		</h1>
		<nav class="col6 h50 flef flex-end die700">
	     	<ul class="">
	     		<li class="li"><a href="cerrar_sesion.jsp?cerrar='si'">Cerrar Sesion</a></li>
	     	</ul>
	     	
	     </nav>
	</header>
<br>
<br>
	<div class="col12 h60vh mauto">
		<div class="content-option mauto ">
			<a href="preguntas.jsp?b=Informatica" class="option info">
				<i class="img_1 fa"></i><samp> Informatica</samp>
			</a>
			<a href="preguntas.jsp?b=Arte" class="option arte">
				<i class="img_2 fa"></i><samp> Arte</samp>
			</a>
			<a href="preguntas.jsp?b=Sociales" class="option soci">
				<i class="img_3 fa"></i><samp> Sociales</samp>
			</a>	
			<a href="preguntas.jsp?b=Economia" class="option eco">
				<i class="img_4 fa"></i><samp> Economia</samp>
			</a>
		</div>
		</div>
  
</div>

<div class="col6  mauto fblue3" id="resultado-ajax">
a
</div>
<%
	out.println(sesionOk.getAttribute("dni"));
	if (sesionOk.getAttribute("pregunta")=="0" ){
		out.println("esta bien");
	}else{
		sesionOk.setAttribute("puntos","0"); 
		sesionOk.setAttribute("pregunta","0"); 
		out.println("TRAMPoso"+(String)sesionOk.getAttribute("NIC"));
	}


%>
   <script src="js/controlador.js"></script>  
 </body>
</html>