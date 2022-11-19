package repositories;


import database.DAO;
import models.AlunoModel;
import org.hibernate.HibernateException;

import javax.swing.*;
import java.util.ArrayList;


public class AlunoRepository {
    private static DAO<AlunoModel> dao;
    static {
        dao = new DAO<>(AlunoModel.class);
    }

    public static void gravar(AlunoModel aluno){
        dao.openTransaction().add(aluno).closeTransaction();
    }

    public static AlunoModel findByMatricula(int matricula){

        return dao.findByID(matricula);

    }

    public static void update(AlunoModel aluno){
        dao.openTransaction().update(aluno).closeTransaction();
    }

    public static ArrayList<AlunoModel> findAll(){
        return new ArrayList<>(dao.findAll());
    }

    public static void delete(AlunoModel aluno){
        dao.openTransaction().delete(aluno).closeTransaction();
    }

}
