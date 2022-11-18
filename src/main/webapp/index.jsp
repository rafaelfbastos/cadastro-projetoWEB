<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%@ include file="head.jsp"%>

  <body>
    <%@ include file="nav.jsp"%>

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

   <%@ include file="script.jsp"%>
  </body>
</html>