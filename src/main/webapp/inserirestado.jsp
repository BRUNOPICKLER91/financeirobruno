<%-- 
    Document   : alterarestado
    Created on : 29/11/2015, 20:40:24
    Author     : bruno.pickler
--%>

<%@page import="controle.EstadoDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Estado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Estado</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
         <%
            String mensagem = "Informe os dados para novo estado!";
            if(request.getParameter("btnEnviar") != null){                
                String nome = request.getParameter("nome");
                String est_sigla = request.getParameter("est_sigla");
                Estado estado = new Estado(est_sigla, nome);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = EstadoDB.incluiEstado(estado, conexao);
                if (incluiu){
                    mensagem = "Estado incluido com sucesso!";
                            }else{
                    mensagem = "Erro ao incluir a estado!";
                                  }
            }
            
            out.println(mensagem);
            out.println("<br/>");
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
                <li><a href="listarestado.jsp" target="_parent">Voltar</a></li>
            </ul>
        </nav><br /><br />
        <div class="container theme-showcase" role="main" class="form-horizontal">
        <h1>Inserir Novo Estado</h1>
        <form name="fmrEstado" method="post">
            Sigla <input type="text" name="est_sigla" maxlength="10" size="8" class="form-control" />
            <br/>
            Nome: <input type="text" name="nome" maxlength="100" size="80" class="form-control" />            
            <input type="submit" name="btnEnviar" value="Enviar" class="btn btn-success" />
        </form>
        </div>
    </body>
</html>

