<%@ include file="verifica_sessao.jsp"%>

<%@ page import="pClassificados.pAnuncio.* , pClassificados.pUsuario.*" %>
<%@ page import="java.util.*" %>

<html>
<body>

<%
	int cod_usu_logado = ( (Integer) session.getAttribute("codigo_usuario") ).intValue();

	int codigo = Integer.parseInt(request.getParameter("codigo_anuncio"));
	
	

	Anuncio detalhe_anuncio = new Anuncio();
	Usuario detalhe_usuario = new Usuario();

	ServidorAnuncio sv_anuncio = new ServidorAnuncio();
	ServidorUsuario sv_usuario = new ServidorUsuario();	 
	
	detalhe_anuncio = sv_anuncio.retornarAnuncio(codigo);
	detalhe_usuario = sv_usuario.retornarUsuario(detalhe_anuncio.getCodigo_usuario());
	
%>	

Detalhes do Anuncio:|codigo: <%=detalhe_anuncio.getCodigo()%>  |   Titulo:	<%=detalhe_anuncio.getTitulo()%>  |  Descricao: <%=detalhe_anuncio.getDescricao()%>  |  Data: <%=detalhe_anuncio.getData()%>  | <br>

Detalhes do Usuario: |Nome: <%=detalhe_usuario.getNome()%> | Email:  <%=detalhe_usuario.getEmail()%>



<br> <br>
<h3>Incluir: ( <a href="incluir_anuncio.jsp">novo anuncio</a> )</h3>

<h3><a href="lista_anuncios.jsp">Voltar aos anuncios</a> </h3>


</body>
</html>
