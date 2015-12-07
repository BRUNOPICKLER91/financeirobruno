<%-- 
    Document   : listapessoas
    Created on : 28/11/2015, 19:37:19
    Author     : bruno.pickler
--%>

<%@page import="modelo.Pessoa"%>
<%@page import="controle.PessoaDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Pessoas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body> 
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Bruno Pickler</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.html" target="_parent">Voltar</a></li>
                <li><a href="inserirpessoa.jsp" target="_parent">Nova Pessoa</a></li>
            </ul>
        </nav>
        <br /><br />
        <h1>Lista de pessoas</h1>
        <div class="col-md-12">
        <table class="table table-bordered">
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = PessoaDB.getListaCidades(conexao);        
        out.println("<tr>");
        out.println("<td>Código</td>");
        out.println("<td>Nome</td>");
        out.println("<td>Email</td>");
        out.println("<td>Idade</td>");
        out.println("<td>Opções</td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Pessoa pessoa = (Pessoa)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+pessoa.getPes_codigo()+"</td>");
            out.println("<td>"+pessoa.getNome()+"</td>");
            out.println("<td>"+pessoa.getEmail()+"</td>");
            out.println("<td>"+pessoa.getIdade()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluirpessoa.jsp?id="+pessoa.getPes_codigo()+"\">Excluir</a>");
            out.println("<a href=\"alterarpessoa.jsp?id="+pessoa.getPes_codigo()+"\">Alterar</a>");
            out.println("</td>");
            out.println("<br/>");
        }
        %>
        </table>
        </div>
        </div>
    </body>
</html>
