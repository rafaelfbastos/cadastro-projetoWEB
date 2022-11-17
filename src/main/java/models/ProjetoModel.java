package models;

import jakarta.persistence.*;
import org.hibernate.annotations.Type;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Entity
@Table(name = "projeto")
public class ProjetoModel {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;
   private String titulo;
   private String area;
   private String cidade;
   private String estado;
   @Column(length = 1000)
   private String descricao;
   @ManyToMany
   @JoinTable(name = "equipes",
   joinColumns = @JoinColumn(name = "id_projeto",referencedColumnName = "id"),
   inverseJoinColumns = @JoinColumn(name = "matricula",referencedColumnName = "matricula"))
   private List<AlunoModel> alunos;

    public ProjetoModel( String titulo, String area, String cidade, String estado, String descricao, List<AlunoModel> alunos) {
        this.titulo = titulo;
        this.area = area;
        this.cidade = cidade;
        this.estado = estado;
        this.descricao = descricao;
        this.alunos = alunos;

    }
    public ProjetoModel(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<AlunoModel> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<AlunoModel> alunos) {
        this.alunos = alunos;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProjetoModel that = (ProjetoModel) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
