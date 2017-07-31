package com.kosmo.web.junit;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.kosmo.web.erp.controller.ErpController;

public class StandAloneTest {
	
	private MockMvc mockMvc;

	//�׽�Ʈ �޼ҵ� ������ �¾� �޼ҵ��Դϴ�.
	@Before
	public void setup(){
		//�̰����� HomeController�� MockMvc ��ü�� ����ϴ�.
		this.mockMvc = MockMvcBuilders.standaloneSetup(new ErpController()).build();
	}

	@Test
	public void test() throws Exception{
		//ErpController�� "/search" �������� �����մϴ�.
		this.mockMvc.perform(get("/searchAll"))
		//ó�� ������ ����մϴ�.
		.andDo(print())
		//���°��� OK�� ���;� �մϴ�.
		.andExpect(status().isOk());
		//attribute�� �����ؾ� �մϴ�.
		//.andExpect(model().attributeExists("searchAll"));
	}
}
