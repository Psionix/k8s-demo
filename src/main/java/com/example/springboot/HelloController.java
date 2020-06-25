package com.example.springboot;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class HelloController {

	@RequestMapping("/")
	public String index() {
		// if(true)
		// 	throw new InternalErrorException();
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
		Date date = new Date();
		String result = dateFormatter.format(date);
		return result;
	}

	@ResponseStatus(HttpStatus.SERVICE_UNAVAILABLE)
	public class InternalErrorException extends RuntimeException {
	} 

}
