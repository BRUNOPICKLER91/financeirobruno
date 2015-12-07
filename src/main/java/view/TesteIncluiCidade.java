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
public class TesteIncluiCidade {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        Cidade cidade = new Cidade(3, "Lontras","SC");
        boolean incluiu = CidadeDB.incluiCidade(cidade, conexao);
        if(incluiu){
            System.out.println("Cidade incluída.");
        }
        else
        {
            System.out.println("Não incluiu.");
        }
    }
}
