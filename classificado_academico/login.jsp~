<%@ page import="pClassificados.pUsuario.*" %>


<html>
<body>

<%
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");

	if( (login != null) && (senha != null) )
	{
		if( (login.equals("")) || (senha.equals("")))

		{%>
			<br>
			<h2> Usuário inválido </h2>
			<br> <br> 
			<h4> Tente novamente: </h4>
			<br>
		<%}
		else
		{
		ServidorUsuario servUsu = new ServidorUsuario();
		
		int codigo = servUsu.verificarUsuarioSenha(login, senha);
		
		if( codigo > 0 )
		{
			session.setAttribute("codigo_usuario", new Integer(codigo) );
%>
			<jsp:forward page="lista_anuncios.jsp"/>	
<%	
		}
		}
	
	}	
	else
	{
%>		<br>
		<h2> Bem vindo ao serviço de classificados acadêmicos da UFPA </h2>
		<br> <br> 
		<h4> Para poder utilizar este serviço voçê deve identificar-se: </h4>
		<br> 
<%	}
%>

<form name="formulario_login" action="login.jsp" method="post">
Login: <input type="text" name="login" size=25 maxlength=25> <br> 
Senha: <input type="password" name="senha" size=25 maxlength=25> 
<input type="submit" value="OK">
</form> 

<br> 
<h4> Se você ainda não é usuário, cadastre-se clicando <a href="cadastro_usuario.jsp">aqui</a>.</h4>

</body>
</html>
