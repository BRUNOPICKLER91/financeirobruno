/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controle.CidadeDB;
import controle.Conexao;
import java.sql.Connection;
import java.util.ArrayList;
import modelo.Cidade;

/**
 *
 * @author aluno
 */
public class TesteListaCidade {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        ArrayList lista = CidadeDB.getListaCidades(conexao);
        for(int i = 0; i < lista.size(); i++){
            Cidade cidade = (Cidade) lista.get(i);
            System.out.println("Código: " + cidade.getCid_codigo());
            System.out.println("Nome: " + cidade.getNome());
            System.out.println("Estado: " + cidade.getEst_sigla());
            System.out.println("---------------------------");            
        }
    }
}
