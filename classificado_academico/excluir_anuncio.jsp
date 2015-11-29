<%@ include file="verifica_sessao.jsp"%>

<%@ page import="pClassificados.pAnuncio.*" %>
<%@ page import="java.util.*" %>

<html>
<body>

<%
	int cod_usu_logado = ( (Integer) session.getAttribute("codigo_usuario") ).intValue();

	int codigo = Integer.parseInt(request.getParameter("codigo_anuncio"));
	
	String validador = request.getParameter("validador");

	Anuncio ex_anuncio = new Anuncio();

	ServidorAnuncio sv = new ServidorAnuncio(); 
	if(validador == null){	
	ex_anuncio = sv.retornarAnuncio(codigo);
	
%>	

|  codigo: <%=ex_anuncio.getCodigo()%>  |   
Titulo:	<%=ex_anuncio.getTitulo()%>  |  
Descricao: <%=ex_anuncio.getDescricao()%>  |  
Data: <%=ex_anuncio.getData()%>  |  

<form name="formulario_busca" action="excluir_anuncio.jsp" method="post">
<input type="hidden" name= "validador" value = "ok"> 
<input type="hidden" name= "codigo_anuncio" value = "<%=ex_anuncio.getCodigo()%>"> 
<input type="submit" value="Excluir Anuncio">
</form> 
<%}else{
	sv.excluirAnuncio(codigo);
%>
Anuncio excluido com Sucesso!!!!!!!

<br> <br>
<h3>Incluir: ( <a href="incluir_anuncio.jsp">novo anuncio</a> )</h3>
<br><br>
<h3>Incluir: ( <a href="lista_anuncios.jsp">Voltar aos anuncios</a> )</h3>

<%}%>
</body>
</html>
