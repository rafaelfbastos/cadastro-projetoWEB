<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.ProjetoModel" %>
<%@ page import="models.AlunoModel" %>
<%@ page import="java.util.HashMap" %>


<%
    ArrayList<ProjetoModel> projetos = (ArrayList<ProjetoModel>) request.getAttribute("projetos");
    if(projetos==null) projetos = new ArrayList<>() ;
    HashMap<String, Object> alert = (HashMap<String, Object>) request.getAttribute("alert");
    ArrayList<String> mensagens = new ArrayList<>();
    String classe = "";
    if (alert != null && !alert.isEmpty()) {
        classe = (String) alert.get("class");
        mensagens = (ArrayList<String>) alert.get("mensagem");
    }
%>
<%@ include file="head.jsp" %>

<body>

<%@ include file="nav.jsp" %>

<div class="container">

    <%@ include file="alerta.jsp" %>
    <h1 class="text-center">Lista de Projetos</h1>
    <% for (ProjetoModel projeto : projetos) { %>
    <div class="border border-secondary border-opacity-50 my-5 p-2">
        <div class="row my-2">
            <h3 class="col"><span class="text-secondary"><%= projeto.getTitulo()%></span></h3>
        </div>
        <table class="table table-dark table-striped">
            <thead>
            <tr>
                <th scope="col"><h5>Área:</h5></th>
                <th scope="col"><h5>Cidade:</h5></th>
                <th scope="col"><h5>Estado:</h5></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%= projeto.getArea()%>
                </td>
                <td><%= projeto.getCidade()%>
                </td>
                <td><%= projeto.getEstado()%>
                </td>

            </tr>
            </tbody>
        </table>
        <div class="col p-3">
            <h5 class="row">Descrição:</h5>
            <div class="row text-lg-start">
                <%= projeto.getDescricao()%>
            </div>
        </div>
        <div class="col p-3">
            <h5 class="row"> Equipe:</h5>
        </div>

        <table class="table table-secondary table-striped">
            <thead>
            <tr>
                <th scope="col"><h6>Matrícula</h6></th>
                <th scope="col"><h6>Nome</h6></th>
                <th scope="col"><h6>Curso</h6></th>
                <th scope="col"><h6>E-mail</h6></th>
                <th scope="col"><h6>Telefone</h6></th>
            </tr>
            </thead>
            <tbody>
            <%for (AlunoModel aluno : projeto.getAlunos()) {%>
            <tr>
                <td><%= aluno.getMatricula()%>
                </td>
                <td><%= aluno.getNome()%>
                </td>
                <td><%= aluno.getCurso()%>
                </td>
                <td><%= aluno.getEmail()%>
                </td>
                <td><%= aluno.getTelefone()%>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <div class="row justify-content-md-center">
            <div class="col col-md-auto">
                <button type="button" onclick="atualizar(<%= projeto.getId()%>)" class="btn btn-outline-success btn-lg">Atualizar</button>
            </div>
            <div class="col-md-auto">
                <button type="button" onclick="apagar(<%= projeto.getId()%>)" class="btn btn-outline-danger btn-lg">Apagar</button>
            </div>
        </div>
    </div>
    <%}%>


</div>

<script>
    function apagar(id){
        let senha = prompt("Digite a senha:");
        window.location.href = "apagar-projeto?projeto="+id+"&senha="+senha;
    }
    function atualizar(id){
        window.location.href = "atualizar-projeto?id="+id;
    }
</script>
<%@ include file="script.jsp" %>
</body>
</html>