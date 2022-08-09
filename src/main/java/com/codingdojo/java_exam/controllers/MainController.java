package com.codingdojo.java_exam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.java_exam.models.Login;
import com.codingdojo.java_exam.models.BabyNames;
import com.codingdojo.java_exam.models.User;
import com.codingdojo.java_exam.services.BabyService;
import com.codingdojo.java_exam.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private BabyService babies;
	
	 @Autowired
     private UserService users;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new Login());
		return "Index.jsp";
	}
	
	@GetMapping("/home")
	public String babies(@ModelAttribute("baby") BabyNames babynames, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
		
		model.addAttribute("babies", babies.all());
		return "Dashboard.jsp";
		}	
	
	@GetMapping("/names/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
		model.addAttribute("baby", babies.find(id));
		model.addAttribute("babies", babies.all());
		
		return "EditName.jsp";
		}
	
	@GetMapping("/names/{id}")
	public String view(@PathVariable("id") Long id, Model model,HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
		
		
		model.addAttribute("babynames", babies.find(id));
		model.addAttribute("babies", babies.all());
		
		return "ViewName.jsp";
		}
	
	@PostMapping("/home")
	public String create(@Valid @ModelAttribute("babynames") BabyNames babynames, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("babies", babies.all());
			return "Dashboard.jsp";
		}
		babies.create(babynames);
		return "redirect:/home";
	}
	
	 @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        
	    	User user = users.register(newUser, result);
	    	
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new Login());
	            return "Index.jsp";
	        }
	        session.setAttribute("userId", user.getId());
	    
	        return "redirect:/home";
	    }
	 
	 @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") Login newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        
	        User user = users.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "Index.jsp";
	        }
	        session.setAttribute("userId", user.getId());
	    
	        return "redirect:/home";
	    }
	
	@PutMapping("/names/{id}")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("babynames") BabyNames babynames, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("babies", babies.all());
			return "EditName.jsp";
		}
		
		babies.update(babynames);
		
		return "redirect:/home";
	}
	
	@DeleteMapping("/names/{id}")
	public String delete(@PathVariable("id") Long id) {
		
		babies.delete(id);
		
		return "redirect:/home";
	}
	
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.invalidate();
	    	return "redirect:/";
	    }
}

