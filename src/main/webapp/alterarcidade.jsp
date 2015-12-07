<%-- 
    Document   : alterarcidade
    Created on : 19/08/2015, 21:36:24
    Author     : djonata
--%>

<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.CidadeDB"%>
<%@page import="modelo.Cidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Cidade</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para alteração!";
            Cidade cidade = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
               int codigo = Integer.valueOf(request.getParameter("codigo"));
               String nome = request.getParameter("nome");
               String estado = request.getParameter("estado");
               cidade = new Cidade(codigo, nome, estado);              
               boolean alterou = CidadeDB.alteraCidade(cidade, conexao);
               if(alterou){
                   mensagem = "Cidade alterada com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar a cidade!";
               }
            }
            out.println(mensagem);
            out.println("<br />");         
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            cidade = CidadeDB.getCidade(codigo, conexao);
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
                <li><a href="listarpessoas.jsp" target="_parent">Pessoas</a></li>
            </ul>
        </nav>
        <br /><br />
        <h1>Alterar Cidade</h1>
        <form name="frmAlterar" method="post" class="form-horizontal">
            Nome: <input type="text" name="nome" maxlength="100" size="80" value="<%=cidade.getNome()%>" class="form-control" />
            <br/>
            Estado: <input type="text" name="estado" maxlength="2" size="3" value="<%=cidade.getEst_sigla()%>" class="form-control" />
            <br/>            
            <input type="hidden" name="codigo" value="<%=id%>"/>
            <input type="submit" name="btnAltera" value="Alterar" class="btn btn-success"/>
        </form>
    </body>
</html>
