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
import modelo.Estado;

/**
 *
 * @author aluno
 */
public class EstadoDB {
    public static ArrayList getListaEstados(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("select * from estado");
            while(rs.next()){
                String auxSigla = rs.getString("est_sigla");
                String auxNome = rs.getString("nome");
                Estado estado = new Estado(auxSigla, auxNome);
                lista.add(estado);
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
        }
        finally{
            return lista;
        }
    }
    
    public static boolean incluiEstado(Estado estado, Connection conexao){
        boolean incluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("insert into estado (est_sigla, nome) values (?,?)");
            ps.setString(2, estado.getNome());
            ps.setString(1, estado.getEst_sigla()); 
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
    
    public static boolean alteraEstado(Estado estado, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("update estado set nome = ? where est_sigla = ?");
            ps.setString(1, estado.getNome());
            ps.setString(2, estado.getEst_sigla());
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
    
    public static boolean excluiEstado(String sigla, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("delete from estado where est_sigla = ?");
            ps.setString(1, sigla);
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
    
    public static Estado getEstado(String est_sigla, Connection conexao){
        Estado estado = null;
        try{
            PreparedStatement ps = conexao.prepareStatement("select * from estado where est_sigla = ?");
            ps.setString(1, est_sigla);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String auxCodigo = rs.getString("est_sigla");
                String auxNome = rs.getString("nome");                
                estado = new Estado(auxCodigo, auxNome);
            }
        }catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }finally{
            return estado;
        }
    }
    
}
