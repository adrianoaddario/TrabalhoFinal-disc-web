
<%@ include file="verifica_sessao.jsp"%>

<%@ page import="pClassificados.pAnuncio.*" %>
<%@ page import="java.util.*" %>

<html>
<body>

<%
	String busca = request.getParameter("busca");
	
	List <Anuncio> vAnuncios = new ArrayList < Anuncio > ();

	ServidorAnuncio servAnu = new ServidorAnuncio();
	
	if( busca == null || busca == "") 
	{
		vAnuncios = servAnu.retornarAnuncios();
	}
	else
	{
		vAnuncios = servAnu.retornarAnunciosBusca( busca );
	}

		int cod_usu_logado = ( (Integer) session.getAttribute("codigo_usuario") ).intValue();	
%>

	<br>
	<h2> Anúncios encontrados:</h2>
	<br>  


<table border=1>
 <tr>
  <td width=60 valign=top><b>Código</b> </td>
  <td width=400 valign=top><b>Título (Consultar)</b> </td>
  <td width=60 valign=top><b>Alterar</b> </td>
  <td width=60 valign=top><b>Excluir</b> </td>
 </tr>
 

<%
	Iterator it = vAnuncios.iterator();
	
	while (it.hasNext())
    {
		Anuncio anuncio = (Anuncio) it.next();
%>
	 <tr>
	  <td width=60 valign=top> <%=anuncio.getCodigo()%> </td>
	  <td width=400 valign=top> <a href="detalhe_anuncio.jsp?codigo_anuncio=<%=anuncio.getCodigo()%>"><%=anuncio.getTitulo()%></a>  </td>
	  
	  <td width=60 valign=top>
	  <%
	  		if( cod_usu_logado == anuncio.getCodigo_usuario()  )
	  		{
	  %>		  
	  			<a href="alterar_anuncio.jsp?codigo_anuncio=<%=anuncio.getCodigo()%>"> A </a> 
	  <%	}
	  %> </td>
	  
	  <td width=60 valign=top>
	  <%
	  		if( cod_usu_logado == anuncio.getCodigo_usuario()  )
	  		{
	  %>		  
	  			<a href="excluir_anuncio.jsp?codigo_anuncio=<%=anuncio.getCodigo()%>"> E </a> 
	  <%	}
	  %> </td>
	  
	 </tr>
<%
	} 
 %>
 
</table>


<br><br>

<form name="formulario_busca" action="lista_anuncios.jsp" method="post">
Busca: <input type="text" name="busca" size=45 maxlength=50>  
<input type="submit" value="OK">
</form> 

<br> <br>
<h3>Incluir: ( <a href="incluir_anuncio.jsp">novo anuncio</a> )</h3>


</body>
</html>
