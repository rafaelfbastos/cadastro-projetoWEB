<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>

<%
   HashMap<String,Object> alert =  (HashMap<String,Object>) request.getAttribute("alert");
    ArrayList<String> mensagens = new ArrayList<>();
    String classe = "";
    if(alert!=null && !alert.isEmpty()){
        classe = (String) alert.get("class");
        mensagens = (ArrayList<String>) alert.get("mensagem");
    }
%>
  <%@ include file="head.jsp"%>

  <body>

    <%@ include file="nav.jsp"%>

    <div class="container my-5">
        <%if(alert!=null && !alert.isEmpty()){%>
            <%for(String mensagem: mensagens){%>
                <div class="<%= classe %>" role="alert">
                 <%= mensagem %>
            </div>
         <% }%>
        <% }%>
        <h1 class="text-center">Cadastro de Alunos</h1>
        <form action="cadastrar-aluno" id="form-projeto" method="post" >
          <div class="mb-3">
            <label for="inputMatricula" class="form-label">Matrícula</label>
            <input type="number" class="form-control" id="inputMatricula" name="inputMatricula" required>
          </div>
          <div class="mb-3">
            <label for="inputNome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="inputNome" name="inputNome" required>
          </div>
         <div class="mb-3">
             <label for="inputEmail" class="form-label">E-Mail</label>
             <input type="email" class="form-control" id="inputEmail" name="inputTelefone" required>
         </div>
          <div class="mb-3">
               <label for="inputCelular" class="form-label">Celular</label>
               <input type="text" class="form-control" id="inputCelular" name="inputCelular" required>
          <div class="mb-3">
                 <label for="inputCurso" class="form-label">Curso</label>
                 <input type="text" class="form-control" id="inputCurso" name="inputCurso" required>
          </div>
          <div class="mb-3">
                 <label for="inputPassword" class="form-label">Senha</label>
                 <input type="password" class="form-control" id="inputPassword" name="inputPassword" required>
          </div>
          </form>
         <button type="submit" form="form-projeto" class="btn btn-secondary">Submit</button>
    </div>

   <%@ include file="script.jsp"%>
  <script>
  $(document).ready(function(){
    $('#inputCelular').mask('(00) 000-000-000');
  });
  </script>

  </body>
</html>