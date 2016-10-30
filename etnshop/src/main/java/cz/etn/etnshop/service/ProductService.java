package cz.etn.etnshop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cz.etn.etnshop.dao.Product;

public interface ProductService {

    @Transactional
    List<Product> getProducts();

    @Transactional
    Product getProductById(int id);
    
    @Transactional
    void updateProduct(Product product);
    
    @Transactional
    void createProduct(Product product);
}
