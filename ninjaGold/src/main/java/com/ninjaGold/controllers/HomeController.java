package com.ninjaGold.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session) {
		//begin session at 0 gold
		if(session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		//begin activity list 
		ArrayList<String> activities = new ArrayList<String>();//list to hold activities
		
		if(session.getAttribute("activities") == null) {
			session.setAttribute("activities", activities);
		}
		
		return "index.jsp";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String getGold(@RequestParam(name = "location") String location, HttpSession session) {
		
		int gold = (int) session.getAttribute("gold");//need to typecast it since session is an object
		Random random = new Random();//import the Random class
		int random_num = 0;
		
		//get activity list from session (need to cast it)
		ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
		
		//make timestamp variable
		LocalDateTime timestamp = LocalDateTime.now();
		DateTimeFormatter formatted = DateTimeFormatter.ofPattern("MMMM dd yyyy h:mma");
		
		
		if(location.equals("farm")) {
			//10-20 gold
			//generate random number between 10 and 20
			//to get by range: random.nextInt(max - min + 1) + min since default is 0 to max
			random_num = random.nextInt(20 - 10 + 1) + 10;
//			System.out.println(random_num);
		}
		else if(location.equals("cave")) {
			//5-10 gold
			random_num = random.nextInt(10 - 5 + 1) + 5;
		}
		else if(location.equals("house")) {
			//2-5 gold
			random_num = random.nextInt(5 - 2 + 1) + 2;
		}
		else if(location.equals("casino")) {
			//+/- 0-50 gold
			random_num = random.nextInt(50 + 50 + 1) - 50;
			System.out.println(random_num);
		}
		else if(location.equals("spa")) {
			//- 5-20 gold
			random_num = random.nextInt(-5 + 20 + 1) - 20;
			System.out.println(random_num);
		}
		
		
		if(random_num < 0) {
			activities.add(0, "You entered a " + location + " and lost "+ Math.abs(random_num) +" gold. (" + formatted.format(timestamp) + ")");
			//note: by adding argument 0, it is adding the new item to the FRONT of the list instead of the back
		}
		else {
			activities.add(0, "You entered a " + location + " and earned "+ random_num +" gold. (" + formatted.format(timestamp) + ")");
		}
		
		//update session variables
		session.setAttribute("gold", gold + random_num);
		session.setAttribute("activities", activities);             
		System.out.println(activities);
//		System.out.println(Collections.reverse(activities));
		
		//Send the ninja to a debtors prison on a second rendered page if the ninja falls too far into debt
		if((int) session.getAttribute("gold") < -50) {
			return "redirect:/prison";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public String clear(HttpSession session) {
		//clear session
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/prison", method = RequestMethod.GET)
	public String prison(HttpSession session) {
		
		return "prison.jsp";
	}
}
