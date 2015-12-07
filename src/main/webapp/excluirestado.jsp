<%-- 
    Document   : exluirestado
    Created on : 29/11/2015, 11:21:13
    Author     : bruno.pickler
--%>

<%@page import="controle.EstadoDB"%>
<%@page import="modelo.Estado"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Estado</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "";
            Connection conexao = Conexao.getConexao();
            Estado estado = null;
            if(request.getParameter("btnexclui") != null){
             String est_sigla = String.valueOf(request.getParameter("est_sigla"));             
             boolean excluiu = EstadoDB.excluiEstado(est_sigla, conexao);
             if(excluiu){
                 mensagem = "Estado excluido com sucesso!";
             }else{
                 
                 mensagem = "Não foi possivel excluir o estado!";
             }
            }
            out.println(mensagem);
            out.println("<br/>");
            
            String id = request.getParameter("est_sigla");            
            estado = EstadoDB.getEstado(id, conexao);            
            if(estado != null){
                out.println("Deseja excluir o estado " + estado.getNome() + "?");
                out.println("<br />");
            }
        %>
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
                <li><a href="listacidades.jsp" target="_parent">Cidades</a></li>
                <li><a href="listaestados.jsp" target="_parent">Estados</a></li>
                <li><a href="listarpessoas.jsp" target="_parent">Pessoas</a></li>
            </ul>
        </nav>
        <br /><br />
        <h1>Exclusão de Estado</h1>        
        <form name="exclui" method="post" class="form-horizontal">
            <input type="hidden" name="codigo" value="<%= id %>"/>
            <input type="submit" name="btnexclui" value="Excluir" class="btn btn-success" />
        </form>
    </body>
</html>
