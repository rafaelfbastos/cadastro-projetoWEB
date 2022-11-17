package database;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class DAO<E> {

    private  static EntityManagerFactory emf;
    private EntityManager em;
    private Class<E> classe;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("MySql");
        }catch (Exception e){e.printStackTrace();}
    }
    public DAO(Class<E> classe){
        this.classe = classe;
        em = emf.createEntityManager();
    }
    public DAO(){
        this(null);
    }
    public DAO<E> openTransaction(){
        em.getTransaction().begin();
        return this;
    }
    public DAO<E> closeTransaction(){
        em.getTransaction().commit();
        return this;
    }
    public DAO<E> add(E entidade){
        em.persist(entidade);
        return this;
    }
    public DAO<E> update(E entidade){
        em.merge(entidade);
        return this;
    }
    public DAO<E> delete(E entidade){
        em.remove(entidade);
        return this;
    }

    public E findByID(Object id){
        return em.find(classe,id);
    }

    public ArrayList<E> findAll(){
        String jpql = "select e from "+classe.getName()+" e";
        TypedQuery<E> query = em.createQuery(jpql,classe);
        return new ArrayList<>(query.getResultList());
    }
    public void close(){
        em.close();
    }

}
