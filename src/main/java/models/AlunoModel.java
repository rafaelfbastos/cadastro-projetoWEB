package models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "aluno")
public class AlunoModel {

    @Id
    private int matricula;
    private String nome;
    private String email;
    private String telefone;
    private String curso;
    @ManyToMany(mappedBy = "alunos")
    private List<ProjetoModel> projetos;
    private int senha;

    public AlunoModel(int matricula, String nome, String email, String telefone, String curso, int senha) {
        this.matricula = matricula;
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.curso = curso;
        this.senha = senha;
    }

    public AlunoModel(){}

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public int getSenha() {
        return senha;
    }

    public void setSenha(int senha) {
        this.senha = senha;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AlunoModel that = (AlunoModel) o;
        return matricula == that.matricula;
    }

    public List<ProjetoModel> getProjetos() {
        return projetos;
    }

    public void setProjetos(List<ProjetoModel> projetos) {
        this.projetos = projetos;
    }

    @Override
    public int hashCode() {
        return Objects.hash(matricula);
    }

    @Override
    public String toString() {

        return String.format("%d \u27F6  %s",matricula,nome);
    }
}
