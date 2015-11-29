<%@ page import="pClassificados.pUsuario.*" %>

<html>
<body>

<%
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	String nome = request.getParameter("nome");
	String email = request.getParameter("email");
	
	
	if( (login != null) && (senha != null) && (nome != null) && (email != null) )
	{
		if( (login.equals("")) || (senha.equals(""))|| (nome.equals("")) || (email.equals("")) )
		{%>
		
		<h2>Existem campos nulos! Não é possivel cadastrar!</h2>

		<%}else{
		Usuario usuario = new Usuario();

		usuario.setLogin(login);	
		usuario.setSenha(senha);
		usuario.setNome(nome);
		usuario.setEmail(email);
		
		ServidorUsuario servUsu = new ServidorUsuario();
		
		
		if( servUsu.inserirUsuario( usuario)  )
		{
%>
			<jsp:forward page="login.jsp"/>
				
<%	
		}
		else
		{
%>			<br>
			<h2> Cadastro não realizado. </h2>
			<br> <br> 
			<h4> Tente novamente: </h4>
			<br> 
<%		}

		}

	}
%>	




<h2> Cadastro de Usuários </h2>
<br>  


<form name="formulario_cadastro_usuario" action="cadastro_usuario.jsp" method="post">
Login: <input type="text" name="login" size=20 maxlength=20> <br> 
Senha: <input type="text" name="senha" size=20 maxlength=20> <br>
Nome: <input type="text" name="nome" size=40 maxlength=40> <br> 
E-mail: <input type="text" name="email" size=40 maxlength=40>
<input type="submit" value="OK">  
</form> 


</body>
</html>
