<%
	String cerrar = request.getParameter("cerrar");
HttpSession sesionOk=request.getSession();
	if(cerrar!=null){
		sesionOk.invalidate();
		response.sendRedirect("login.jsp");
	}else{
		response.sendRedirect("error.jsp");
	}
%>