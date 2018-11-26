package com.jeecg.demo.controller;
import javax.servlet.http.HttpServletRequest;

import org.jeecgframework.core.common.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/testc")
public class TestController extends BaseController {
	
	@RequestMapping(params = "index")
	public ModelAndView index(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/demo/testcindex");
	}

	
}
