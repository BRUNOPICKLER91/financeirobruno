/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controle.Conexao;
import controle.EstadoDB;
import java.sql.Connection;
import modelo.Estado;

/**
 *
 * @author aluno
 */
public class TesteAlteraEstado {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        Estado estado = new Estado("TO", "Bahia");
        boolean alterou = EstadoDB.alteraEstado(estado, conexao);
        if(alterou){
            System.out.println("Estado alterado.");
        }
        else
        {
            System.out.println("Estado não alterado.");
        }
    }
}
