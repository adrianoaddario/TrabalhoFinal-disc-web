package pClassificados.pUsuario;

import java.sql.*;

public class ServidorUsuario {

	private Connection con;

	public ServidorUsuario() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=aluno&password=aluno");
		} catch (Exception e) {
			System.out.println("Erro 1:" + e);
		}
	}

	protected void finalize() throws Throwable {
		try {
			con.close();
		} finally {
			super.finalize();
		}
	}

	public int verificarUsuarioSenha(String login, String senha) {
		int codigo = -1;
		try {

			String aSQL = "SELECT * FROM test.tab_usuario where login = '" + login + "' and senha = '" + senha + "';";
			Statement stmt = con.createStatement();
			ResultSet rset = stmt.executeQuery(aSQL);

			if (rset.next()) {
				codigo = rset.getInt("codigo");
			}

			rset.close();
			stmt.close();

		} catch (Exception e) {
			System.out.println("Erro 2:" + e);
		}

		return codigo;
	}

	public boolean inserirUsuario(Usuario usuario) {

		try {

			Statement stmt = con.createStatement();

			String SQL = "INSERT INTO `test`.`tab_usuario`  (`login`, `senha`, `nome`, `email`)  VALUES ('"
					+ usuario.getLogin() + "', '" + usuario.getSenha() + "', '" + usuario.getNome() + "','"
					+ usuario.getEmail() + "');";

			String fSQL = "SELECT * FROM test.tab_usuario where login = '" + usuario.getLogin() + "' and senha = '"
					+ usuario.getSenha() + "'and nome='" + usuario.getNome() + "' and email = '" + usuario.getEmail()
					+ "';";

			stmt.executeUpdate(SQL);

			ResultSet rset = stmt.executeQuery(fSQL);

			if (rset.next()) {
				return true;
			} 

			rset.close();
			stmt.close();



			

		} catch (Exception e) {
			System.out.println("Erro 3:" + e);
			return false;
		}
	
		return false;
	}

	public Usuario retornarUsuario(int codigo) {

		try {

			Statement stmt = con.createStatement();

			String bSQL = "SELECT * FROM test.tab_usuario where codigo = '" + codigo + "';";

			ResultSet rset = stmt.executeQuery(bSQL);

			if (rset.next()) {

				Usuario usuario = new Usuario();

				usuario.setLogin(rset.getString("login"));
				usuario.setSenha(rset.getString("senha"));
				usuario.setNome(rset.getString("nome"));
				usuario.setEmail(rset.getString("email"));

				return usuario;

			}

			stmt.close();

		} catch (Exception e) {
			System.out.println("Erro 3:" + e);

		}

		return null;
	}

}
