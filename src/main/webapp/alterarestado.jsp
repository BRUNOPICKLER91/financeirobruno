<%-- 
    Document   : alterarestado
    Created on : 29/11/2015, 20:30:24
    Author     : bruno.pickler
--%>

<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.EstadoDB"%>
<%@page import="modelo.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Estado</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para alteração!";
            Estado estado = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
               String est_sigla = request.getParameter("nome");
               String nome = request.getParameter("nome");
               estado = new Estado(est_sigla, nome);              
               boolean alterou = EstadoDB.alteraEstado(estado, conexao);
               if(alterou){ 
                   mensagem = "Estado alterado com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar o estado!";
               }
            }
            out.println(mensagem);
            out.println("<br />");         
            
            String id = request.getParameter("est_sigla");
            
            estado = EstadoDB.getEstado(id,conexao);
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
        <h1>Alterar Cidade</h1>
        <form name="frmAlterar" method="post" class="form-horizontal">
            Nome: <input type="text" name="nome" maxlength="100" size="80" value="<%=estado.getNome()%>" class="form-control" />
            <br/>
            Sigla: <input type="text" name="est_sigla" maxlength="2" size="3" value="<%=estado.getEst_sigla()%>" class="form-control" />
            <br/>            
            <input type="hidden" name="codigo" value="<%=id%>"/>
            <input type="submit" name="btnAltera" value="Alterar" class="btn btn-success"/>
        </form>
    </body>
</html>
