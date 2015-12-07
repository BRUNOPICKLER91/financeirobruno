<%-- 
    Document   : alterarpessoa
    Created on : 29/11/2015, 17:20:44
    Author     : bruno.pickler
--%>

<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.ContaDB"%>
<%@page import="modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração Conta</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "Informe os dados para alteração!";
            Conta conta = null;
            Connection conexao = Conexao.getConexao();
            if(request.getParameter("btnAltera") != null){
                int codigo = Integer.valueOf(request.getParameter("cnt_numero"));
                String descricao = request.getParameter("descricao");               
                String data = request.getParameter("data");
                String tipo = request.getParameter("tipo");
                Double valor = Double.valueOf(request.getParameter("valor"));
                String situacao = request.getParameter("situacao");
                int pes_codigo = Integer.valueOf(request.getParameter("pes_codigo"));                
                conta = new Conta(codigo, descricao, data,valor,tipo,situacao,pes_codigo);
                conexao = Conexao.getConexao();
               boolean alterou = ContaDB.alteraConta(conta, conexao);
               if(alterou){
                   mensagem = "Pessoa alterada com sucesso!";
               }else{
                   mensagem = "Não foi possível alterar a pessoa!";
               }
            }
            out.println(mensagem);
            out.println("<br />");         
            
            String id = request.getParameter("cnt_numero");
            int codigo = Integer.valueOf(id);
            conta = ContaDB.getConta(codigo, conexao);
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
                <li><a href="listaconta.jsp" target="_parent">Contas</a></li>
                <li><a href="listaestado.jsp" target="_parent">Estados</a></li>
                <li><a href="listarpessoas.jsp" target="_parent">Pessoas</a></li>
            </ul>
        </nav>
        <br /><br />
        <h1>Alterar Pessoa</h1>
        <form name="frmAlterar" method="post" class="form-horizontal">            
            Descrição: <input type="text" name="descricao" maxlength="100" size="80" class="form-control" value="<%=conta.getDescricao()%>" />
            <br/>
            Data: <input type="text" name="data" maxlength="20" size="10" class="form-control"  value="<%=conta.getData()%>" />
            <br/>
            Tipo: <input type="text" name="tipo" maxlength="2" size="3" class="form-control"  value="<%=conta.getTipo()%>" />
            <br/>
            Situação: <input type="text" name="situacao"  size="15" class="form-control" value="<%=conta.getSituacao()%>" />
            <br/>
            Código da Pessoa: <input type="text" name="pes_codigo" maxlength="25" size="3" class="form-control"  value="<%=conta.getPes_codigo()%>" />
            <br/>           
            <input type="hidden" name="cnt_numero" value="<%=id%>"/>
            <input type="submit" name="btnAltera" value="Alterar" class="btn btn-success" />
        </form>
    </body>
</html>
