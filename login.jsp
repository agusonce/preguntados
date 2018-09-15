<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=divice-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body bgcolor="aqua">

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
  if (usuario!=null){
  	 response.sendRedirect("index.jsp");
  }
%>
    <div class="main-content fondo_7 cover">
  <div class="h10vh"></div>
  <div class="h80vh">
    <div class="col10 mauto juscenter">
     <form name="" action="login.jsp" method="get" class="p5  col6"> 
        <p class="font2 f50 cblanco p10 textcenter ">Login</p>
            <input type="text" name="nic" placeholder="Usuario" class="input">
            <input type="password" name="pass" placeholder="Passwor" class="input">
            <input type="submit" name="enviar" value="Ingresar" class="boton">
            
      </form>

    </div>
    <p class="col10 mauto textcenter p10 textdnone"><a href="#" class="textdnone col12 textcenter h50 link">Registrar</a></p>
  </div>
 
  <footer class="h10vh">
    <p class="textcenter cblanco">
      agusonce17@gmail.com
    </p>
    
  </footer>
</div>
    	 
    	 
    	 <%
         String nic = request.getParameter("nic");
         String pass = request.getParameter("pass");
         if (nic!=null){
        	 cadSQL="SELECT * FROM alumnos WHERE (usuario='"+nic+"')and(password='"+pass+"');";
           	 out.println(cadSQL);
             try  
             {
           	 %><center><% 
            tabla=instruccion.executeQuery(cadSQL);
    			if (tabla.next())	
           	    {
           		 	out.println("EL USUARIO EXISTE"); 
           		 	
           		 	
           		 	sesionOk.setAttribute("NIC", nic);
           		 	sesionOk.setAttribute("PASSWORD", pass);
           		 sesionOk.setAttribute("dni", tabla.getString(1));
           		 
           		 
           		 sesionOk.setAttribute("pregunta","0"); 
           		sesionOk.setAttribute("correcta","0"); 
           		sesionOk.setAttribute("puntos","0"); 
           		 	response.sendRedirect("index.jsp");
           		 	
             	}
    			else
    			{
    				out.println("EL USUARIO NO EXISTE");
    			}
             	 %></center><% 
             }
             catch(SQLException e)  //hubo un error al insertar
              {out.println(e);}; 
         }
         //SELECT * FROM nuevo.usuario WHERE (pass='asd')and(nro_carnet='1223');
       	
%>

</body>
</html>