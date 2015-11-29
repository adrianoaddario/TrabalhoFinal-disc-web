<%@ include file="verifica_sessao.jsp"%>
<%@ page import="pClassificados.pAnuncio.*" %>
<%@ page import="java.util.*" %>

<html>
<body>

<%
	int cod_usu_logado = ( (Integer) session.getAttribute("codigo_usuario") ).intValue();

	String titulo = request.getParameter("titulo");
	String descricao = request.getParameter("descricao");
	String data = request.getParameter("data");
	String validar = request.getParameter("validar");
	
	
	if( validar !=null )
	{
		Anuncio novo_anuncio = new Anuncio();

		novo_anuncio.setTitulo(titulo);	
		novo_anuncio.setDescricao(descricao);
		novo_anuncio.setData(data);
		novo_anuncio.setCodigo_usuario(cod_usu_logado);
		
		ServidorAnuncio servAnu = new ServidorAnuncio();
		boolean ok = servAnu.inserirAnuncio(novo_anuncio);
		
		
		if( ok  )
		{
%>
			Anuncio incluido com sucesso!
<br><br>
Dados inseridos:<br>
Titulo: <%=novo_anuncio.getTitulo()%><br>
Descricao: <%=novo_anuncio.getDescricao()%><br>
Data: <%=novo_anuncio.getData()%><br>

<br>
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
<form name="formulario_cadastro_usuario" action="incluir_anuncio.jsp" method="post">

Titulo: <input type="text" name="titulo" size=20 maxlength=20> <br>
Descricao: <input type="text" name="descricao" size=40 maxlength=40> <br> 
Data: <input type="text" name="data" size=40 maxlength=40>
<input type="hidden" name="validar" value="ok">
<input type="submit" value="OK">  
</form>
<%		}
	}else{
%>	



<br>
<h2> Incluir Anuncio </h2>
<br>  


<form name="formulario_cadastro_usuario" action="incluir_anuncio.jsp" method="post">

Titulo: <input type="text" name="titulo" size=20 maxlength=20> <br>
Descricao: <input type="text" name="descricao" size=40 maxlength=40> <br> 
Data: <input type="text" name="data" size=40 maxlength=40>
<input type="hidden" name="validar" value="ok">
<input type="submit" value="OK">  
</form> 

<%}%>

</body>
</html>
