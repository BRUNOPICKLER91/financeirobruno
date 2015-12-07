<%-- 
    Document   : listacidades
    Created on : 19/08/2015, 19:38:11
    Author     : djonata
--%>

<%@page import="modelo.Cidade"%>
<%@page import="controle.CidadeDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Cidades</title>
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
                <li><a href="inserircidade.jsp" target="_parent">Nova Cidade</a></li>
            </ul>
        </nav>
        <br /><br />
        <div class="container theme-showcase" role="main">
        <h1>Lista de cidades</h1>
        <div class="col-md-12">
        <table class="table table-bordered">
        <%
        Connection conexao = Conexao.getConexao();
        ArrayList lista = CidadeDB.getListaCidades(conexao);        
        out.println("<tr>");
        out.println("<td>Código</td>");
        out.println("<td>Nome</td>");
        out.println("<td>Estado</td>");
        out.println("<td>Opções</td>");
        out.println("</tr>");
        for(int i = 0; i < lista.size(); i++){
            Cidade cidade = (Cidade)lista.get(i);
            out.println("<tr>");
            out.println("<td>"+cidade.getCid_codigo()+"</td>");
            out.println("<td>"+cidade.getNome()+"</td>");
            out.println("<td>"+cidade.getEst_sigla()+"</td>");
            out.println("<td>");
            out.println("<a href=\"excluircidade.jsp?id="+cidade.getCid_codigo()+"\">Excluir</a>");
            out.println("<a href=\"alterarcidade.jsp?id="+cidade.getCid_codigo()+"\">Alterar</a>");
            out.println("</td>");
            out.println("<br/>");
        }
        %>
        </table>
        </div>
        </div>
    </body>
</html>
