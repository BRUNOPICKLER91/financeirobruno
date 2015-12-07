/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controle.Conexao;
import controle.EstadoDB;
import java.sql.Connection;

/**
 *
 * @author aluno
 */
public class TesteExcluiEstado {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        String sigla = "SC";
        boolean excluiu = EstadoDB.excluiEstado(sigla, conexao);
        if(excluiu){
            System.out.println("Estado excluído.");
        }
        else{
            System.out.println("Estado não excluído.");
        }
            
    }
}
