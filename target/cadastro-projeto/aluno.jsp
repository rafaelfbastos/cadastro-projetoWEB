<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<%
    HashMap<String,String> alert = (HashMap<String,String>) request.getAttribute("alert");
%>
<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de Projetos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index">Cadastro de Projetos</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link active" aria-current="page" href="#">Cadastro Projetos</a>
          <a class="nav-link" href="projetos">Listar Projetos</a>
          <a class="nav-link" href="#">Pesquisar Aluno</a>
          <a class="nav-link" href="aluno">Cadastro de Aluno</a>
        </div>
      </div>
    </div>
  </nav>
    <div class="container my-5">
        <%if(alert!=null && !alert.isEmpty()){%>
            <div class="<%= alert.get("class")%>" role="alert">
              <%= alert.get("mensagem")%>
            </div>
        <% }%>
        <h1 class="text-center">Cadastro de Alunos</h1>
        <form action="cadastrar-aluno" id="form-projeto" method="post">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/jquery.mask.min.js"</script>
    <script src="assets/js/script.js"</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  <script>
  $(document).ready(function(){
    $('#inputCelular').mask('(00) 000-000-000');
  });
  </script>

  </body>
</html>