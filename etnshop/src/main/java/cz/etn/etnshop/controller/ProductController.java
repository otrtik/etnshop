package cz.etn.etnshop.controller;

import cz.etn.etnshop.dao.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cz.etn.etnshop.service.ProductService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("product/list");
        modelAndView.addObject("products", productService.getProducts());
        return modelAndView;
    }

    @RequestMapping(value = "/list/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView("product/edit");
        modelAndView.addObject("product", productService.getProductById(id));
        return modelAndView;
    }

    @RequestMapping(value = "/list/edit/{id}", method = RequestMethod.POST)
    public String processEdit(@ModelAttribute("product") Product product, @PathVariable int id) {
        Product p = productService.getProductById(product.getId());
        p.setName(product.getName());
        p.setSerialNumber(product.getSerialNumber());
        
        productService.updateProduct(p);
        
        return "redirect:/product/list";
    }
    
    @RequestMapping(value = "/list/create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView modelAndView = new ModelAndView("product/create");
        return modelAndView;
    }

    @RequestMapping(value = "/list/create", method = RequestMethod.POST)
    public String processCreate(@ModelAttribute("product") Product product) {
        Product p = new Product();
        p.setName(product.getName());
        p.setSerialNumber(product.getSerialNumber());
        
        productService.createProduct(p);
        
        return "redirect:/product/list";
    }
}
