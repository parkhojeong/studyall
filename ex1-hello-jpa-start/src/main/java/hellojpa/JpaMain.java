package hellojpa;

import jakarta.persistence.*;
import jpabook.jpashop.domain.Member;
import jpabook.jpashop.domain.Order;

public class JpaMain {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");
        EntityManager em = emf.createEntityManager();

        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        try {
            // query
            System.out.println("======");
            Member member = new Member();
            member.setName("member1");
            em.persist(member);
//
            Order order = new Order();
            order.setMember(member);
            em.persist(order);

            System.out.println("======");

            transaction.commit();
        } catch (Exception e) {
            System.out.println("==Error==");
            e.printStackTrace();
            System.out.println(e.getMessage());
            transaction.rollback();
        } finally {
            em.close();
            emf.close();
        }
    }
}
