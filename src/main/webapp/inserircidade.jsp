<%-- 
    Document   : inserircidade
    Created on : 19/08/2015, 20:14:57
    Author     : djonata
--%>

<%@page import="controle.CidadeDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Cidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Cidade</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
         <%
            String mensagem = "Informe os dados para nova cidade!";
            if(request.getParameter("btnEnviar") != null){
                int codigo = Integer.valueOf(request.getParameter("codigo"));
                String nome = request.getParameter("nome");
                String estado = request.getParameter("estado");
                Cidade cidade = new Cidade(codigo, nome, estado);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = CidadeDB.incluiCidade(cidade, conexao);
                if (incluiu){
                    mensagem = "Cidade incluida com sucesso!";
                            }else{
                    mensagem = "Erro ao incluir a cidade!";
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
                <li><a href="listacidades.jsp" target="_parent">Voltar</a></li>
            </ul>
        </nav><br /><br />
        <div class="container theme-showcase" role="main" class="form-horizontal">
        <h1>Inserir Nova Cidade</h1>
        <form name="fmrCidade" method="post">
            Código: <input type="text" name="codigo" maxlength="10" size="8" class="form-control" />
            <br/>
            Nome: <input type="text" name="nome" maxlength="100" size="80" class="form-control" />
            <br/>
            Estado: <input type="text" name="estado" maxlength="5" size="3" class="form-control" />
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar" class="btn btn-success" />
        </form>
        </div>
    </body>
</html>
