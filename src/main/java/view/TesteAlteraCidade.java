/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controle.CidadeDB;
import controle.Conexao;
import java.sql.Connection;
import modelo.Cidade;

/**
 *
 * @author aluno
 */
public class TesteAlteraCidade {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        Cidade cidade = new Cidade(3, "São José dos Pinhais","PR");
        boolean alterou = CidadeDB.alteraCidade(cidade, conexao);
        if(alterou){
            System.out.println("Cidade alterada.");
        }
        else
        {
            System.out.println("Cidade não alterada.");
        }
    }
}
