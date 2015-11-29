package pClassificados.pAnuncio;



public class Anuncio {
	
	private int codigo;
	private String titulo;
	private String descricao;
	private String data;
	private int codigo_usuario;	

	public Anuncio() {
		this.codigo = 0;
		this.titulo = "";
		this.descricao = "";
		this.data = "";
		this.codigo_usuario = 0;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getCodigo_usuario() {
		return codigo_usuario;
	}

	public void setCodigo_usuario(int codigo_usuario) {
		this.codigo_usuario = codigo_usuario;
	}
		
}	
