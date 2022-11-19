<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.AlunoModel" %>
<%@ page import="models.ProjetoModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="head.jsp" %>

<%
    HashMap<String, Object> alert = (HashMap<String, Object>) request.getAttribute("alert");
    ArrayList<String> mensagens = new ArrayList<>();
    String classe = "";
    if (alert != null && !alert.isEmpty()) {
        classe = (String) alert.get("class");
        mensagens = (ArrayList<String>) alert.get("mensagem");
    }
    AlunoModel aluno = (AlunoModel) request.getAttribute("aluno");
    ArrayList<ProjetoModel> projetos = (ArrayList<ProjetoModel>) request.getAttribute("projetos");

%>

<body>
<%@ include file="nav.jsp" %>

<div class="container my-5 ">
    <%@ include file="alerta.jsp" %>
    <h1 class="text-center">Pesquisar Aluno</h1>
    <form id="pesquisar" class="row justify-content-center align-items-center my-5 g-3" method="post"
          action="pesquisar-aluno">
        <div class="col-auto me-3">
            <h4>Matrícula:</h4>
        </div>
        <div class="col-auto">
            <label for="inputMatricula" class="visually-hidden">Password</label>
            <input type="number" class="form-control form-control-lg" name="inputMatricula" id="inputMatricula">
        </div>
        <div class="col-auto a">
            <button type="submit" form="pesquisar" class="btn btn-outline-secondary btn-lg">Pesquisar</button>
        </div>
    </form>
    <% if (aluno != null) {%>
    <h4>Dados do Aluno: </h4>
    <div class="border border-secondary border-opacity-50 my-5 p-2">
        <div class="row justify-content-start p-2">
            <div class="col-3">
                <h5>Matrícula:</h5>
            </div>
            <div class="col-3">
                <h5><%= aluno.getMatricula()%>
                </h5>
            </div>
        </div>
        <div class="row justify-content-start p-2">
            <div class="col-3">
                <h5>Nome:</h5>
            </div>
            <div class="col-3">
                <h5><%= aluno.getNome()%>
                </h5>
            </div>
        </div>
        <div class="row justify-content-start p-2">
            <div class="col-3">
                <h5>Curso:</h5>
            </div>
            <div class="col-3">
                <h5><%= aluno.getCurso()%>
                </h5>
            </div>
        </div>
        <div class="row justify-content-start p-2">
            <div class="col-3">
                <h5>E-mail:</h5>
            </div>
            <div class="col-3">
                <h5><%= aluno.getEmail()%>
                </h5>
            </div>
        </div>
        <div class="row justify-content-start p-2">
            <div class="col-3">
                <h5>Telefone:</h5>
            </div>
            <div class="col-3">
                <h5><%= aluno.getTelefone()%>
                </h5>
            </div>
        </div>
        <div class="row my-4">
            <div class="d-grid gap-2 col-6 mx-auto">
                <a href="atualizar-aluno?matricula=<%= aluno.getMatricula()%>" type="button"
                   class="btn btn-outline-success ">
                    Atualizar
                </a>
            </div>
        </div>
    </div>
    <h1 class="text-center">Projetos envolvidos:</h1>
    <table class="table table-secondary table-striped mt-4">
        <thead>
        <tr>
            <th scope="col"><h6>Título:</h6></th>
            <th scope="col"><h6>Área:</h6></th>
            <th scope="col"><h6>Cidade:</h6></th>
            <th scope="col"><h6>Estado:</h6></th>
        </tr>
        </thead>
        <tbody>
        <%for (ProjetoModel projeto : projetos) {%>
        <tr>
            <td><%= projeto.getTitulo()%>
            </td>
            <td><%= projeto.getArea()%>
            </td>
            <td><%= projeto.getCidade()%>
            </td>
            <td><%= projeto.getEstado()%>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <div class="row px-2">
        <a href="listar-projeto-aluno?matricula=<%= aluno.getMatricula()%>" class="btn btn-outline-secondary btn-lg btn-block">Mais Detalhes</a>
    </div>

    <%}%>
</div>

<%@ include file="script.jsp" %>
</body>
</html>