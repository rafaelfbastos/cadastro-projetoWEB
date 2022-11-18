<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
        <h1 class="text-center">Cadastro de Projeto</h1>
        <form action="cadastrar" id="form-projeto">
          <div class="mb-3">
            <label for="inputTitulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="inputTitulo" name="inputTitulo" required>
          </div>
          <div class="mb-3">
            <label for="inputArea" class="form-label">Area</label>
            <input type="text" class="form-control" id="inputArea" name="inputArea" required>
          </div>
         <div class="mb-3">
             <label for="inputCidade" class="form-label">Cidade</label>
             <input type="text" class="form-control" id="inputCidade" name="inputCidade" required>
         </div>
          <div class="mb-3">
               <label for="inputEstado" class="form-label">Estado</label>
               <input type="text" class="form-control" id="inputEstado" name="inputEstado" required>
           </div>
             <label for="descricaoInput">Descrição</label>
            <div class="mb-3">
                <textarea class="form-control"  id="descricaoInput"  name="descricaoInput" style="height: 100px" required></textarea>
            </div>
            <div class="mb-3">
                 <label for="inputEstado" class="form-label">Estado</label>
                 <input type="text" class="form-control" id="inputEstado" name="inputEstado" required>
            </div>
        <div class="row g-3 align-items-center">
          <div class="col-auto">
            <label for="qtdMembros" class="col-form-label">Quatidade de membros da equipe: </label>
          </div>
          <div class="col-auto">
            <input type="number" id="qtdMembros" name="qtdMembros" class="form-control" required>
          </div>
          <div class="col-auto">
             <button id ="inserir" type="button"class="btn btn-secondary">Inserir</button>
          </div>
          <br>
           </div>
        <div id="box">
             <br>
         </div>
        </form>
        <br>
         <button type="submit" form="form-projeto" class="btn btn-secondary">Submit</button>
    </div>

    <script src="assets/js/script.js"</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  </body>
</html>