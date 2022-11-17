var button = document.getElementById('inserir');
var n_menbros = document.getElementById('qtdMembros');
var box = document.getElementById('box');

button.addEventListener("click", inserir);

function inserir(){
    var cont = n_menbros.value;
    for (var i = 1; i <= cont; i++) {
       criarEstrutura(i);
    }

}

/*
<div class="col-auto">
<label for="qtdMembros" class="col-form-label">Quatidade de membros da equipe: </label>
 </div>
 <div class="col-auto">
<input type="number" id="qtdMembros" name="qtdMembros" class="form-control" required>
 </div>
*/
function criarEstrutura(i){

    var div0 = document.createElement('div');
    div0.setAttribute('class','row g-3 align-items-center');

    var div1 = document.createElement('div');
    div1.setAttribute('class','col-auto');
    var label = document.createElement('label');
    label.setAttribute('class','col-form-label');
    label.setAttribute('for','matricula'+i);
    label.textContent = "Matrícula";
    div1.appendChild(label);
    var div2 = document.createElement('div');
    div2.setAttribute('class','col-auto');
    var input = document.createElement('input');
    input.setAttribute('class','form-control');
    input.setAttribute('type','number');
    input.setAttribute('id','matricula'+i);
    input.setAttribute('name','matricula'+i);
    div2.appendChild(input);
    div0.appendChild(div1);
    div0.appendChild(div2);
    box.appendChild(div0);
    var espaco = document.createElement('br');
    box.appendChild(espaco);


}