<%
	// evitar cache
	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", -1); 
	//response.setHeader("Expires", "0");
	//response.setHeader("Pragme", "no-cache");
	//if(request.getProtocol().equals("HTTP/1.1"))
	{
		response.setHeader("Cache-Control", "no-cache");
	}

	// verificar se usuário realizou login
	if( session.getAttribute("codigo_usuario") == null )
	{
%>		<jsp:forward page="login.jsp"/>	
<%	
	}
%>
