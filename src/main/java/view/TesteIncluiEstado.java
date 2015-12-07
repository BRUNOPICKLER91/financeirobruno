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
public class TesteIncluiEstado {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        Estado estado = new Estado("TO", "Tocantins");
        boolean incluiu = EstadoDB.incluiEstado(estado, conexao);
        if(incluiu){
            System.out.println("Estado incluído.");
        }
        else
        {
            System.out.println("Não incluiu.");
        }
    }
}
