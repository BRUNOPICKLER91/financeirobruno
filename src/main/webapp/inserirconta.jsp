<%-- 
    Document   : inserirconta
    Created on : 29/11/2015, 13:15:12
    Author     : bruno.pickler
--%>

<%@page import="controle.ContaDB"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Conta</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para nova pessoa!";
            if (request.getParameter("btnEnviar") != null) {
                int codigo = Integer.valueOf(request.getParameter("cnt_numero"));
                String descricao = request.getParameter("descricao");               
                String data = request.getParameter("data");
                String tipo = request.getParameter("tipo");
                Double valor = Double.valueOf(request.getParameter("valor"));
                String situacao = request.getParameter("situacao");
                int pes_codigo = Integer.valueOf(request.getParameter("pes_codigo"));                
                Conta conta = new Conta(codigo, descricao, data,valor,tipo,situacao,pes_codigo);
                Connection conexao = Conexao.getConexao();
                boolean incluiu = ContaDB.incluiConta(conta, conexao);
                if (incluiu) {
                    mensagem = "Conta incluída com sucesso!";
                } else {
                    mensagem = "Erro ao incluir a conta!";
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
            Conta: <input type="text" name="cnt_numero" maxlength="10" size="8" class="form-control" />
            <br/>
            Descrição: <input type="text" name="descricao" maxlength="100" size="80" class="form-control" />
            <br/>
            Data: <input type="text" name="data" maxlength="20" size="10" class="form-control" />
            <br/>
            Tipo: <input type="text" name="tipo" maxlength="2" size="3" class="form-control" />
            <br/>
            Situação: <input type="text" name="situacao"  size="15" class="form-control" />
            <br/>
            Código da Pessoa: <input type="text" name="pes_codigo" maxlength="25" size="3" class="form-control" />
            <br/>
            <input type="submit" name="btnEnviar" value="Enviar" class="btn btn-success" />
        </form>
        </div>
    </body>
</html>
