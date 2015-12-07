/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controle.CidadeDB;
import controle.Conexao;
import java.sql.Connection;

/**
 *
 * @author aluno
 */
public class TesteExcluiCidade {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        int codigo = 3;
        boolean excluiu = CidadeDB.excluiCidade(codigo, conexao);
        if(excluiu){
            System.out.println("Cidade excluída.");
        }
        else{
            System.out.println("Cidade não excluída.");
        }
            
    }
}
