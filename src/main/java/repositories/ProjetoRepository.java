package repositories;

import database.DAO;
import models.AlunoModel;
import models.ProjetoModel;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;


public class ProjetoRepository {
    public static DAO<ProjetoModel> dao;

    static {
        dao = new DAO<>(ProjetoModel.class);
    }

    public static void add(ProjetoModel projeto) {

        dao.openTransaction().add(projeto).closeTransaction();
        JOptionPane.showMessageDialog(null, "Projeto Cadastrado com sucesso", "Aviso", JOptionPane.INFORMATION_MESSAGE);
    }

    public static ArrayList<ProjetoModel> findAll() {
        return dao.findAll();
    }

    public static void update(ProjetoModel projeto) {
        dao.openTransaction().update(projeto).closeTransaction();
        JOptionPane.showMessageDialog(null, "Projeto Atualizado com sucesso", "Aviso", JOptionPane.INFORMATION_MESSAGE);
    }

    public static void delete(ProjetoModel projeto) {

        dao.openTransaction().delete(projeto).closeTransaction();

    }

    public static List<ProjetoModel> findByAluno(AlunoModel aluno) {

        return AlunoRepository.findByMatricula(aluno.getMatricula()).getProjetos();
    }
}
