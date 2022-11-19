<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
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
%>

<body>
<%@ include file="nav.jsp" %>

<div class="container my-5">
    <%@ include file="alerta.jsp"%>
    <h1 class="text-center">Cadastro de Projeto</h1>
    <form action="cadastrar" id="form-projeto" method="post">
        <div class="mb-3">
            <label for="inputTitulo" class="form-label">Título:</label>
            <input type="text" class="form-control" id="inputTitulo" name="inputTitulo" required>
        </div>
        <div class="mb-3">
            <label for="inputArea" class="form-label">Área:</label>
            <input type="text" class="form-control" id="inputArea" name="inputArea" required>
        </div>
        <div class="mb-3">
            <label for="inputCidade" class="form-label">Cidade:</label>
            <input type="text" class="form-control" id="inputCidade" name="inputCidade" required>
        </div>
        <div class="mb-3">
            <label for="inputEstado" class="form-label">Estado:</label>
            <input type="text" class="form-control" id="inputEstado" name="inputEstado" required>
        </div>
        <label for="descricaoInput">Descrição:</label>
        <div class="mb-3">
            <textarea class="form-control" id="descricaoInput" name="descricaoInput" style="height: 100px"
                      required></textarea>
        </div>
        <div class="row align-items-start">
            <div class="col-auto">
                <h5>Equipe:</h5>
            </div>
            <div class="col-auto">
                <button id="inserir" type="button" class="btn btn-secondary btn-sm">Click para inserir mais alunos.</button>
            </div>
        </div>
        <br>
        <div id="box">
            <br>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="matricula1" class="col-form-label">Matrícula*:</label>
                </div>
                <div class="col-auto">
                    <input type="number" id="matricula1" name="matricula1" class="form-control" required>
                </div>
            </div>
            <br>
        </div>
    </form>
    <br>
    <div class="row">
        <button type="submit" form="form-projeto" class="btn btn-outline-secondary btn-lg  btn-block">Cadastrar</button>
    </div>

</div>

<script src="assets/js/script_matricula.js"></script>
<%@ include file="script.jsp" %>
</body>
</html>