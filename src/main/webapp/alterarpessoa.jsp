<%-- 
    Document   : alterarpessoa
    Created on : 28/11/2015, 18:40:24
    Author     : bruno.pickler
--%>

<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.PessoaDB"%>
<%@page import="modelo.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Pessoa</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para alteração!";
            Pessoa pessoa = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
                int codigo = Integer.valueOf(request.getParameter("codigo"));
                String nome = request.getParameter("nome");
                int idade = Integer.valueOf(request.getParameter("idade"));
                String email = request.getParameter("email");
                int cid_codigo = Integer.valueOf(request.getParameter("cid_codigo"));
                pessoa = new Pessoa(codigo, nome, idade, email,cid_codigo);
               boolean alterou = PessoaDB.alteraPessoa(pessoa, conexao);
               if(alterou){
                   mensagem = "Pessoa alterada com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar a pessoa!";
               }
            }
            out.println(mensagem);
            out.println("<br />");         
            
            String id = request.getParameter("id");
            int codigo = Integer.valueOf(id);
            pessoa = PessoaDB.getPessoa(codigo, conexao);
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
        <h1>Alterar Pessoa</h1>
        <form name="frmAlterar" method="post" class="form-horizontal">
            Nome: <input type="text" name="nome" maxlength="100" size="80" value="<%=pessoa.getNome()%>" class="form-control" />
            <br/>
            Email: <input type="text" name="email" size="3" value="<%=pessoa.getEmail()%>" class="form-control" />
            <br/>
            Idade: <input type="text" name="idade" size="3" value="<%=pessoa.getIdade()%>" class="form-control" />
            <br/>
            Cidade: <input type="text" name="cid_codigo" size="3" value="<%=pessoa.getCid_codigo()%>" class="form-control" />            
            <br/>
            <input type="hidden" name="codigo" value="<%=id%>"/>
            <input type="submit" name="btnAltera" value="Alterar" class="btn btn-success" />
        </form>
    </body>
</html>
