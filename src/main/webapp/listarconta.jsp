<%-- 
    Document   : listarconta
    Created on : 29/11/2015, 11:10:11
    Author     : bruno.pickler
--%>

<%@page import="modelo.Conta"%>
<%@page import="controle.ContaDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Contas</title>
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
                <li><a href="inserirconta.jsp" target="_parent">Nova Conta</a></li>
            </ul>
        </nav>
        <br /><br />
        <div class="container theme-showcase" role="main">
        <h1>Lista de contas</h1>
        <div class="col-md-12">
        <table class="table table-bordered">
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = ContaDB.getListaConta(conexao);        
        out.println("<tr>");
        out.println("<td>Código</td>");
        out.println("<td>Descrição</td>");
        out.println("<td>Data</td>");
        out.println("<td>Tipo</td>");
        out.println("<td>Valor</td>");
        out.println("<td>Situação</td>");
        out.println("<td>Opções</td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Conta conta = (Conta)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+conta.getCnt_numero()+"</td>");
            out.println("<td>"+conta.getDescricao()+"</td>");
            out.println("<td>"+conta.getData()+"</td>");
            out.println("<td>"+conta.getTipo()+"</td>");
            out.println("<td>"+conta.getValor()+"</td>");
            out.println("<td>"+conta.getSituacao()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluirconta.jsp?id="+conta.getCnt_numero()+"\">Excluir</a>");
            out.println("<a href=\"alterarconta.jsp?id="+conta.getCnt_numero()+"\">Alterar</a>");
            out.println("</td>");
            out.println("<br/>");
        }
        %>
        </table>
        </div>
        </div>
    </body>
</html>
