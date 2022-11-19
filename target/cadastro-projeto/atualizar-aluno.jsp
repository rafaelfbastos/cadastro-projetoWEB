<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.AlunoModel" %>

<%
    HashMap<String, Object> alert = (HashMap<String, Object>) request.getAttribute("alert");
    ArrayList<String> mensagens = new ArrayList<>();
    String classe = "";
    if (alert != null && !alert.isEmpty()) {
        classe = (String) alert.get("class");
        mensagens = (ArrayList<String>) alert.get("mensagem");
    }
    AlunoModel aluno = (AlunoModel) request.getAttribute("aluno");
%>

<%@ include file="head.jsp" %>

<body>

<%@ include file="nav.jsp" %>

<div class="container my-5">
    <%@ include file="alerta.jsp" %>
    <h1 class="text-center">Atualizar cadastro do aluno</h1>
    <form action="atualizar-aluno" id="form-aluno" method="post">
        <div class="mb-3">
            <label for="inputMatricula" class="form-label">Matrícula</label>
            <input type="number" readonly class="form-control" id="inputMatricula" name="inputMatricula" value="<%=aluno.getMatricula()%>" required>
        </div>
        <div class="mb-3">
            <label for="inputNome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="inputNome" name="inputNome" value="<%=aluno.getNome()%>" required>
        </div>
        <div class="mb-3">
            <label for="inputEmail" class="form-label">E-Mail</label>
            <input type="email" class="form-control" id="inputEmail" name="inputTelefone" value="<%=aluno.getEmail()%>" required>
        </div>
        <div class="mb-3">
            <label for="inputCelular" class="form-label">Celular</label>
            <input type="text" class="form-control" id="inputCelular" name="inputCelular" value="<%=aluno.getTelefone()%>" required>
            <div class="mb-3">
                <label for="inputCurso" class="form-label">Curso</label>
                <input type="text" class="form-control" id="inputCurso" name="inputCurso" value="<%=aluno.getCurso()%>" required>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Senha</label>
                <input type="password" class="form-control" id="inputPassword" name="inputPassword" required>
            </div>
        </div>
    </form>
    <div class="row justify-content-md-center">
        <div class="d-grid gap-2 col-6 mx-auto">
            <button type="submit" form="form-aluno" class="btn btn-outline-success btn-lg">Atualizar Cadastro</button>
        </div>
    </div>

</div>

<%@ include file="script.jsp" %>
<script>
    $(document).ready(function () {
        $('#inputCelular').mask('(00) 000-000-000');
    });

    function apagar(){
        let matricula = document.getElementById("inputMatricula").value;
        let senha = document.getElementById("inputPassword").value;
        if(senha){
            window.location.href = "apagar-aluno?matricula="+matricula+"&senha="+senha;
        }
        else{
            alert("Digite a senha");
        }
        console.log("teste");
    }
</script>

</body>
</html>
