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
import modelo.Conta;

/**
 *
 * @author bruno.pickler
 */
public class ContaDB {
    public static ArrayList getListaConta(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("select * from conta");
            while(rs.next()){
                int auxCodigo = rs.getInt("cnt_numero");
                String auxDescricao = rs.getString("descricao");
                String data = rs.getString("data");
                Double valor = rs.getDouble("valor");
                String tipo = rs.getString("tipo");
                String situacao = rs.getString("situacao");
                int pessoa = rs.getInt("pes_codigo");
                Conta conta = new Conta(auxCodigo, auxDescricao, data, valor,tipo,situacao,pessoa);
                lista.add(conta);
            }
        }
        catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
        }
        finally{
            return lista;
        }
    }
    
    public static boolean incluiConta(Conta conta, Connection conexao){
        boolean incluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("insert into conta (cnt_numero, descricao,data, valor, tipo,situacao,pes_codigo) values (?,?,?,?,?,?,?)");
            ps.setString(2, conta.getDescricao());
            ps.setInt(1, conta.getCnt_numero()); 
            ps.setString(3, conta.getData()); 
            ps.setDouble(4, conta.getValor()); 
            ps.setString(5, conta.getTipo()); 
            ps.setString(6, conta.getSituacao()); 
            ps.setInt(7, conta.getPes_codigo()); 
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
    
    public static boolean alteraConta(Conta conta, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("update conta set descricao = ?,data = ?, valor = ?, tipo = ?,situacao = ?,pes_codigo = ? where cnt_numero = ?");
            ps.setString(1, conta.getDescricao());
            ps.setInt(7, conta.getCnt_numero()); 
            ps.setString(2, conta.getData()); 
            ps.setDouble(3, conta.getValor()); 
            ps.setString(4, conta.getTipo()); 
            ps.setString(5, conta.getSituacao()); 
            ps.setInt(6, conta.getPes_codigo());
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
    
    public static boolean excluiConta(int codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement ps = conexao.prepareStatement("delete from conta where cnt_numero = ?");
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
    
    public static Conta getConta(int codigo, Connection conexao){
        Conta conta = null;
        try{
            PreparedStatement ps = conexao.prepareStatement("select * from conta where cnt_numero = ?");
            ps.setInt(1, codigo);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int auxCodigo = rs.getInt("cnt_numero");
                String auxDescricao = rs.getString("descricao");
                String data = rs.getString("data");
                Double valor = rs.getDouble("valor");
                String tipo = rs.getString("tipo");
                String situacao = rs.getString("situacao");
                int pessoa = rs.getInt("pes_codigo");
                conta = new Conta(auxCodigo, auxDescricao, data, valor, tipo, situacao,pessoa);
            }
        }catch(SQLException e){
            System.out.println("Erro de sql: " + e.getMessage());
        }finally{
            return conta;
        }
    }
}
