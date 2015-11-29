package pClassificados.pAnuncio;

import java.sql.*;
import java.util.*;

public class ServidorAnuncio {

	private Connection con;

	public ServidorAnuncio() {

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

	public boolean inserirAnuncio(Anuncio anuncio) {
		try {
			Statement stmt = con.createStatement();
			
			if(("").equals(anuncio.getTitulo()) || ("").equals(anuncio.getData()))

					{
					return false;
					}

					else{
			String SQL = "INSERT INTO `test`.`tab_anuncio2`  (`titulo`, `descricao`, `data`, `codigo_usuario`)  VALUES('"+ anuncio.getTitulo() + "','" + anuncio.getDescricao() + "','" + anuncio.getData() + "', "+ anuncio.getCodigo_usuario() + ");";

			stmt.executeUpdate(SQL);

			stmt.close();

			return true;}

		} catch (Exception e) {

			System.out.println("Erro 2:" + e);

			return false;
		}
	}

	public boolean alterarAnuncio(Anuncio anuncio) {
		try {
			Statement stmt = con.createStatement();

			if(("").equals(anuncio.getTitulo()) || ("").equals(anuncio.getData()))

					{
					return false;
					}

					else{String dSQL = "UPDATE `test`.`tab_anuncio2` SET `titulo`='" + anuncio.getTitulo() + "',`descricao`='"+ anuncio.getDescricao() + "', `data`='" + anuncio.getData() + "', `codigo_usuario`='"	+ anuncio.getCodigo_usuario() + "' WHERE `codigo`='" + anuncio.getCodigo() + "';";

			stmt.executeUpdate(dSQL);

			stmt.close();

			return true;}

		} catch (Exception e) {

			System.out.println("Erro 3:" + e);

			return false;
		}
	}

	public List < Anuncio >  retornarAnuncios() {

		  List < Anuncio > anuncios = new ArrayList < Anuncio > ();

        try {
            Statement stmt = con.createStatement();

            String bSQL = "select*from tab_anuncio2";

            ResultSet rset = stmt.executeQuery(bSQL);

            while (rset.next()) {

                Anuncio anuncio = new Anuncio();

                anuncio.setCodigo(rset.getInt("codigo"));
                anuncio.setTitulo(rset.getString("titulo"));
                anuncio.setDescricao(rset.getString("descricao"));
                anuncio.setData(rset.getString("data"));
                anuncio.setCodigo_usuario(rset.getInt("codigo_usuario"));

		anuncios.add(anuncio);
		
		
            }
		stmt.close();
	
        } catch (Exception e) {

            System.out.println("Erro 4: " + e);

        }

        return anuncios;

	}

	public List < Anuncio >  retornarAnunciosBusca(String busca) {

		 List < Anuncio > lista_busca = new ArrayList < Anuncio > ();


        try {

            Statement stmt = con.createStatement();

            String eSQL = "select*from tab_anuncio2 where titulo like('%"+busca+"%') or descricao like('%"+busca+"%');";

            ResultSet rset = stmt.executeQuery(eSQL);

            while (rset.next()) {

                Anuncio anuncio = new Anuncio();

                anuncio.setCodigo(rset.getInt("codigo"));
                anuncio.setTitulo(rset.getString("titulo"));
                anuncio.setDescricao(rset.getString("descricao"));
                anuncio.setData(rset.getString("data"));
                anuncio.setCodigo_usuario(rset.getInt("codigo_usuario"));

		lista_busca.add(anuncio);
		
		
            }

	stmt.close();

        } catch (Exception e) {

            System.out.println("Erro 5: " + e);

        }

        return lista_busca;

	}

	public Anuncio retornarAnuncio(int codigo) {
		
        try {

            Statement stmt = con.createStatement();

            String aSQL = "select*from tab_anuncio2 where codigo = " + codigo;

            ResultSet rset = stmt.executeQuery(aSQL);

            if (rset.next()) {

                Anuncio anuncio = new Anuncio();

                anuncio.setCodigo(rset.getInt("codigo"));
                anuncio.setTitulo(rset.getString("titulo"));
                anuncio.setDescricao(rset.getString("descricao"));
                anuncio.setData(rset.getString("data"));
                anuncio.setCodigo_usuario(rset.getInt("codigo_usuario"));


                return anuncio;

            }

		stmt.close();

        } catch (Exception e) {

            System.out.println("Erro 6: " + e);

        }

        return null;

	}

	public boolean excluirAnuncio(int codigo) {

		try {
			Statement stmt = con.createStatement();

			String cSQL = "DELETE FROM `test`.`tab_anuncio2` WHERE `codigo`='" + codigo + "';";

			stmt.executeUpdate(cSQL);

			stmt.close();

			return true;
		} catch (Exception e) {

			System.out.println("Erro 7:" + e);

			return false;
		}
	}

}
