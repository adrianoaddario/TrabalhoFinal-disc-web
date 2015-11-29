<%@ include file="verifica_sessao.jsp"%>
<%@ page import="pClassificados.pAnuncio.*" %>
<%@ page import="java.util.*" %>

<html>
<body>

<%
	int cod_usu_logado = ( (Integer) session.getAttribute("codigo_usuario") ).intValue();
	
	int codigo = Integer.parseInt(request.getParameter("codigo_anuncio"));
	String titulo = request.getParameter("titulo");
	String descricao = request.getParameter("descricao");
	String data = request.getParameter("data");
	String validar = request.getParameter("validar");
	
		
	
	if( validar !=null )
	{		

		Anuncio altera_anuncio = new Anuncio();

		altera_anuncio.setCodigo(codigo);
		altera_anuncio.setTitulo(titulo);	
		altera_anuncio.setDescricao(descricao);
		altera_anuncio.setData(data);
		altera_anuncio.setCodigo_usuario(cod_usu_logado);
		
		
		ServidorAnuncio servAnu = new ServidorAnuncio();
		
		boolean ok = servAnu.alterarAnuncio(altera_anuncio);
		
		
		if( ok  )
		{
%>
			Anuncio alterado com sucesso! <br>
			Titulo: <%=altera_anuncio.getTitulo()%><br>
			Descricao: <%=altera_anuncio.getDescricao()%><br>
			Data: <%=altera_anuncio.getData()%><br>
<br> <br>
<h3>Incluir Novo Anuncio: ( <a href="incluir_anuncio.jsp">novo anuncio</a> )</h3>
<h3><a href="lista_anuncios.jsp">Voltar aos anuncios</a> </h3>
				
<%	
		}
		else
		{
%>			<br>
			<h2> Falha ao gravar anuncio. Campos Titulo e Data nao podem ser vazios </h2>
			<br> <br> 
			<h4> Tente novamente: </h4>
			<br> 
<%		}
	}else{
	Anuncio altera1_anuncio = new Anuncio();
	ServidorAnuncio servAnu1 = new ServidorAnuncio();
	
	altera1_anuncio = servAnu1.retornarAnuncio(codigo);

%>	




<h2> Alterar Anuncio </h2>
<br>  

Use os campos abaixo para alterar os dados!<br><br><br>

<form name="formulario_cadastro_usuario" action="alterar_anuncio.jsp" method="post">

Alterar Titulo: <input type="text" name="titulo" value="<%=altera1_anuncio.getTitulo()%>" size=20 maxlength=20> <br>
Alterar Descricao: <input type="text" name="descricao" value="<%=altera1_anuncio.getDescricao()%>" size=40 maxlength=40> <br> 
Alterar Data: <input type="text" name="data" value="<%=altera1_anuncio.getData()%>" size=40 maxlength=40>
<input type="hidden" name="validar" value="ok">
<input type="hidden" name="codigo_anuncio" value="<%=codigo%>">
<input type="submit" value="OK">  
</form> 

<%}%>

</body>
</html>
