/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Cidade;

/**
 *
 * @author djonata
 */
public class CidadeDB {
    public static ArrayList getListaCidades(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("select * from cidade");
            while(rs.next()){
                int auxCodigo = rs.getInt("cid_codigo");
                String auxNome = rs.getString("nome");
                String auxEstado = rs.getString("est_sigla");
                Cidade cidade = new Cidade(auxCodigo, auxNome, auxEstado);
                lista.add(cidade);
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
        }
        finally{
            return lista;
        }
    }
    
    public static boolean incluiCidade(Cidade cidade, Connection conexao){
        boolean incluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("insert into cidade (cid_codigo, nome, est_sigla) values (?,?,?)");
            ps.setString(2, cidade.getNome());
            ps.setInt(1, cidade.getCid_codigo()); 
            ps.setString(3, cidade.getEst_sigla()); 
            int valor  = ps.executeUpdate();
            if(valor == 1){
                incluiu = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        finally{
            return incluiu;
        }
    }
    
    public static boolean alteraCidade(Cidade cidade, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("update cidade set nome = ?, est_sigla = ? where cid_codigo = ?");
            ps.setString(1, cidade.getNome());
            ps.setString(2, cidade.getEst_sigla());
            ps.setInt(3, cidade.getCid_codigo());
            int valor = ps.executeUpdate();
            if(valor == 1){
                alterou = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }
        finally{
            return alterou;
        }
    }
    
    public static boolean excluiCidade(int codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("delete from cidade where cid_codigo = ?");
            ps.setInt(1, codigo);
            int valor = ps.executeUpdate();
            if(valor == 1){
                excluiu = true;
            }
        }
        catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }
        finally{
            return excluiu;
        }
    }
    
    public static Cidade getCidade(int codigo, Connection conexao){
        Cidade cidade = null;
        try{
            PreparedStatement ps = conexao.prepareStatement("select * from cidade where cid_codigo = ?");
            ps.setInt(1, codigo);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int auxCodigo = rs.getInt("cid_codigo");
                String auxNome = rs.getString("nome");
                String auxEstado = rs.getString("est_sigla");
                cidade = new Cidade(auxCodigo, auxNome, auxEstado);
            }
        }catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }finally{
            return cidade;
        }
    }
}
