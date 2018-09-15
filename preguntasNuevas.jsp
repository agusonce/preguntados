<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


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
    String sesionCorrecta=(String)sesionOk.getAttribute("correcta");
    String cate=(String)sesionOk.getAttribute("categoria");
    String res1=request.getParameter("res");	

  //------ contador de pregunta
    String sumpregunta=(String)sesionOk.getAttribute("pregunta");
    int numero2=Integer.parseInt(sumpregunta);
    if(numero2>=10){
    	 try  
		 {
			 cadSQL="UPDATE `nuevo`.`partida` SET  `puntaje`='"+sesionOk.getAttribute("puntos")+"' WHERE `dni`='"+sesionOk.getAttribute("dni")+"' and idcategoria='"+cate+"';";
			z=instruccion.executeUpdate(cadSQL);
				if (z>0){ out.println("se creo");
				}else{out.println("NO se creo");}
		 }
		 catch(SQLException e) {out.println(e);};
    	out.println("<hr>llego a 10<hr>");
    }
	numero2++;
	sumpregunta=String.valueOf(numero2);
	out.println("_"+sumpregunta+"_");
	sesionOk.setAttribute("pregunta",sumpregunta); 
	
	//
  //------ END contador de pregunta
    
    
    out.println("_"+sesionCorrecta+"_"+res1);
    if(sesionCorrecta.equals(res1)){
    	numero2=Integer.parseInt((String)sesionOk.getAttribute("puntos"));
    	sesionOk.setAttribute("puntos",String.valueOf(numero2+10)); 
    	out.println("CORRECTO");
    	out.println("<hr>"+(String)sesionOk.getAttribute("puntos")+"<hr>");
    }else{
    	out.println("INCORRECTO");
    }
	

  %>
  <!-- pregunta ramdon -->
  <%
  	Random ran= new Random();
  int n=0;
  if(cate=="1"){
	  n=ran.nextInt(6)+1;
	  out.println("informatica-");
  }
  if(cate=="5"){
	  n=ran.nextInt(6)+1;  
  }
  	
  %>
  
  
  
  
  <%
  
  cadSQL="SELECT * FROM nuevo.preguntas WHERE idcategoria='"+cate+"' and idpregunta="+n+";";

 String pregunta="";
 String respuesta1="";
 String respuesta2="";
 String respuesta3="";
 String correcta="";
 try  
 {
	tabla=instruccion.executeQuery(cadSQL);
		while (tabla.next())	
	    {
			  pregunta=tabla.getString(2);
			  respuesta1=" <p class='btn_respuestas' onclick='mostrar_preguntas(1)' id='res1'>1)"+tabla.getString(3)+"</p>";
			  respuesta2=" <p class='btn_respuestas' onclick='mostrar_preguntas(2)' id='res1'>2)"+tabla.getString(4)+"</p>";
			  respuesta3=" <p class='btn_respuestas' onclick='mostrar_preguntas(3)' id='res1'>3)"+tabla.getString(5)+"</p>";
			  correcta=tabla.getString(6);
			  sesionOk.setAttribute("correcta",correcta);
		}
 }
 catch(SQLException e) {out.println(e);};
  
  %>
  
  <!--  <p class="btn_respuestas" onclick="mostrar_preguntas(1)" id="res1">1)tu nose</p>
    -->
    <div class="col12 ">
		<div class="mauto hauto preguntas ">
			<div id="pregunta" class=""><% out.println(pregunta);%>
			</div>
		</div>
	</div>

	<div class="col12 hauto">
		<div class="col6  mauto">
			
			<% out.println(respuesta1);%>
			<% out.println(respuesta2);%>
			<% out.println(respuesta3);%>
			<div class="puntaje">
				<% out.println("Puntaje: "+(String)sesionOk.getAttribute("puntos"));%>
			</div>
			<div class="pregunta">
				<% out.println("Pregunta: "+sumpregunta);%>
			</div>
		</div>
	</div>
    
    
<%
  canal.close();
  %>