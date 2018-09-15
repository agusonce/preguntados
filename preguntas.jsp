<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Preguntas</title>
</head>
<body>
<a href="index.jsp">volver</a>
<%
	Connection canal = null; 
	ResultSet tabla= null; 
	Statement instruccion=null; 
	String strcon = "jdbc:mysql://localhost:3306/nuevo?user=root&password=admin"; 
	String cadSQL = ""; 
	int z;

	try  
	{ Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	  canal=DriverManager.getConnection(strcon); 
	  instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
	  ResultSet.CONCUR_UPDATABLE); 
	  
	} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {}; 	
%>

<%
	HttpSession sesionOk=request.getSession();
	String usuario=(String) sesionOk.getAttribute("NIC");
	if (usuario==null){ response.sendRedirect("login.jsp");	}
%>
<%
	String b = request.getParameter("b");
	String tituloC="";
	switch(b)
	{
	case "Informatica":

		if (sesionOk.getAttribute("pregunta")=="0" ){
			sesionOk.setAttribute("categoria","1");
			tituloC="Informatica";
			 try  
			 {
				 cadSQL="INSERT INTO `nuevo`.`partida` (`dni`, `puntaje`, `idcategoria`) VALUES ('"+sesionOk.getAttribute("dni")+"', '0', '1');";
				z=instruccion.executeUpdate(cadSQL);
					if (z>0){ out.println("se creo");
					}else{out.println("NO se creo");}
			 }
			 catch(SQLException e) {out.println(e+"_ÇAGUSTIN LLEGO");};
			 
			%>
			<script src="js/pageLoad.js"></script>
			<%
		}
		
	     
	break;
	case "Arte":
		
		if (sesionOk.getAttribute("pregunta")=="0" ){
			sesionOk.setAttribute("categoria","4");
			tituloC="Arte";
			
			 try  
			 {
				 cadSQL="INSERT INTO `nuevo`.`partida` (`dni`, `puntaje`, `idcategoria`) VALUES ('"+sesionOk.getAttribute("dni")+"', '0', '4');";
				z=instruccion.executeUpdate(cadSQL);
					if (z>0){ out.println("se creo");
					}else{out.println("NO se creo");}
			 }
			 catch(SQLException e) {out.println(e);};
			%>
			<script src="js/pageLoad.js"></script>
			
			<%
		}
	    
	break;
	case "Sociales":
		if (sesionOk.getAttribute("pregunta")=="0" ){
			sesionOk.setAttribute("categoria","3");

			 try  
			 {
				 cadSQL="INSERT INTO `nuevo`.`partida` (`dni`, `puntaje`, `idcategoria`) VALUES ('"+sesionOk.getAttribute("dni")+"', '0', '3');";
				z=instruccion.executeUpdate(cadSQL);
					if (z>0){ out.println("se creo");
					}else{out.println("NO se creo");}
			 }
			 catch(SQLException e) {out.println(e);};
			%>
			<script src="js/pageLoad.js"></script>
			
			<%
		}
	break;
	case "Economia":
		if (sesionOk.getAttribute("pregunta")=="0" ){
			sesionOk.setAttribute("categoria","5");

			 try  
			 {
				 cadSQL="INSERT INTO `nuevo`.`partida` (`dni`, `puntaje`, `idcategoria`) VALUES ('"+sesionOk.getAttribute("dni")+"', '0', '5');";
				z=instruccion.executeUpdate(cadSQL);
					if (z>0){ out.println("se creo");
					}else{out.println("NO se creo");}
			 }
			 catch(SQLException e) {out.println(e);};
			%>
			<script src="js/pageLoad.js"></script>
			
			<%
		}	   
	  
	break;
	default:
		cadSQL="SELECT * FROM preguntas WHERE (idcategoria=5);";
	  	 out.println(cadSQL);
	 
	};

%>


<div class="main-content fondo_hal cover">
	<header class="h50 cblanco mauto header">
		<h1 class="font2  col6  h50 flef ">
			<p class="titulo mauto">
				<% out.println(tituloC);%>
			</p>
		</h1>
		<nav class="col6 h50 flef flex-end die700">
	     	<ul class="">
	     		<li class="li"><a href="cerrar_sesion.jsp?cerrar='si'">Cerrar Sesion</a></li>
	     	</ul>
	     	
	     </nav>
	</header>
<section id="resultado-ajax">
</section>
	

<a href="index.jsp" class="volver">Volver</a>
<hr>
<br> 
<br> 
</div>
<%
canal.close();
%>





<!-- ___________________________________________________________________ -->
<!-- _____________________________AJAX__________________________________ -->
<!-- ___________________________________________________________________ -->

<script src="js/controlador.js"></script>

</body>
</html>