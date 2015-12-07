<%-- 
    Document   : inserirpessoa
    Created on : 28/11/2015, 19:42:12
    Author     : bruno.pickler
--%>

<%@page import="controle.PessoaDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Pessoa</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para nova pessoa!";
            if (request.getParameter("btnEnviar") != null) {
                int codigo = Integer.valueOf(request.getParameter("codigo"));
                String nome = request.getParameter("nome");
                int idade = Integer.valueOf(request.getParameter("idade"));
                String email = request.getParameter("email");
                int cid_codigo = Integer.valueOf(request.getParameter("cid_codigo"));
                Pessoa pessoa = new Pessoa(codigo, nome, idade,email,cid_codigo);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = PessoaDB.incluiPessoa(pessoa, conexao);
                if (incluiu) {
                    mensagem = "Pessoa incluida com sucesso!";
                } else {
                    mensagem = "Erro ao incluir a pessoa!";
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
        <div class="container theme-showcase" role="main">
        <h1>Inserir Nova Pessoa</h1>
        <form name="fmrCidade" method="post" class="form-horizontal">
            Código: <input type="text" name="codigo" maxlength="10" size="8" class="form-control" />
            <br/>
            Nome: <input type="text" name="nome" maxlength="100" size="80" class="form-control" />
            <br/>
            Idade: <input type="text" name="idade" maxlength="2" size="3" class="form-control" />
            <br/>
            Idade: <input type="text" name="idade" maxlength="2" size="3" class="form-control" />
            <br/>
            E-mail: <input type="text" name="email"  size="3" class="form-control" />
            <br/>
            Código da Cidade: <input type="text" name="cid_codigo" maxlength="5" size="3" class="form-control" />
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar" class="btn btn-success" />
        </form>
        </div>
    </body>
</html>
