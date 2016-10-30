package cz.etn.etnshop.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface ProductDao {

	@Transactional(readOnly = true)
	List<Product> getProducts();

        @Transactional(readOnly = true)
        Product getProductById(int id);
        
        @Transactional(readOnly = true)
        void createProduct(Product product);
        
        @Transactional(readOnly = true)
        void updateProduct(Product product);
}
