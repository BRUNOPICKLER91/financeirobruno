<%-- 
    Document   : listaestado
    Created on : 29/11/2015, 10:18:11
    Author     : bruno.pickler
--%>

<%@page import="modelo.Estado"%>
<%@page import="controle.EstadoDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Estado</title>
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
                <li><a href="inserirestado.jsp" target="_parent">Novo Estado</a></li>
            </ul>
        </nav>
        <br /><br />
        <div class="container theme-showcase" role="main">
        <h1>Lista de estados</h1>
        <div class="col-md-12">
        <table class="table table-bordered">
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = EstadoDB.getListaEstados(conexao);        
        out.println("<tr>");
        out.println("<td>Estado Sigla</td>");
        out.println("<td>Nome</td>");
        out.println("<td>Opções</td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Estado estado = (Estado)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+estado.getEst_sigla()+"</td>");
            out.println("<td>"+estado.getNome()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluirestado.jsp?id="+estado.getEst_sigla()+"\">Excluir</a>");
            out.println("<a href=\"alterarestado.jsp?id="+estado.getEst_sigla()+"\">Alterar</a>");
            out.println("</td>");
            out.println("<br/>");
        }
        %>
        </table>
        </div>
        </div>
    </body>
</html>
