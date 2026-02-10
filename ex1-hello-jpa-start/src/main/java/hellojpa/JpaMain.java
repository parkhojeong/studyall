package hellojpa;

import jakarta.persistence.*;

public class JpaMain {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");
        EntityManager em = emf.createEntityManager();

        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        try {
            // query

            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            em.close();
            emf.close();
        }
    }
}
