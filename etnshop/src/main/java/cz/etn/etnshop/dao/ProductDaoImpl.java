package cz.etn.etnshop.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao implements ProductDao {

    @SuppressWarnings("unchecked")
    @Override
    public List<Product> getProducts() {
        Criteria criteria = getSession().createCriteria(Product.class);
        return (List<Product>) criteria.list();
    }

    @Override
    public Product getProductById(int id) {
        Criteria criteria = getSession().createCriteria(Product.class).add(Restrictions.eq("id", id));
        return (Product) criteria.uniqueResult();
    }

    @Override
    public void createProduct(Product product) {
        Session session = getSession();
        session.persist(product);
        session.flush();

    }

    @Override
    public void updateProduct(Product product) {
        Session session = getSession();
        session.merge(product);
        session.flush();
    }
}
