<%-- 
    Document   : exluirconta
    Created on : 29/11/2015, 14:09:25
    Author     : bruno.pickler
--%>

<%@page import="controle.ContaDB"%>
<%@page import="modelo.Conta"%>
<%@page import="controle.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Conta</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String mensagem = "";
            Connection conexao = Conexao.getConexao();
            Conta conta = null;
            if(request.getParameter("btnexclui") !=null){
             int codigo = Integer.valueOf(request.getParameter("cnt_numero"));             
             boolean excluiu = ContaDB.excluiConta(codigo, conexao);
             if(excluiu){
                 mensagem = "Conta excluida com sucelsso!";
             }else{
                 
                 mensagem = "Não foi possivel excluir a conta!";
             }
            }
            out.println(mensagem);
            out.println("<br/>");
            
            String id = request.getParameter("cnt_numero");
            int codigo = Integer.valueOf(id);
            conta = ContaDB.getConta(codigo, conexao);            
            if(conta != null){
                out.println("Deseja excluir a conta " + conta.getDescricao() + "?");
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
                <li><a href="listaconta.jsp" target="_parent">Conta</a></li>
                <li><a href="listaestado.jsp" target="_parent">Estados</a></li>
                <li><a href="listarpessoas.jsp" target="_parent">Pessoas</a></li>
            </ul>
        </nav>
        <br /><br />
        <h1>Exclusão da Conta</h1>        
        <form name="exclui" method="post" class="form-horizontal">
            <input type="hidden" name="cnt_numero" value="<%= id %>"/>
            <input type="submit" name="btnexclui" value="Excluir" class="btn btn-success" />
        </form>
    </body>
</html>
