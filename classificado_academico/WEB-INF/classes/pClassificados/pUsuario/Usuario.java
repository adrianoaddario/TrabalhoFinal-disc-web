package pClassificados.pUsuario;


public class Usuario 
{
	
	private int codigo;
	private String login;
	private String senha;
	private String nome;
	private String email;	

	public Usuario() 
	{
		this.codigo = 0;
		this.login = "";
		this.senha = "";
		this.nome = "";
		this.email = "";
		
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}	
