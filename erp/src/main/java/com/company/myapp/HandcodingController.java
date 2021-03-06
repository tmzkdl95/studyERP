package com.company.myapp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.User;
 

@Controller
public class HandcodingController {
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping(value = "/books/coding.do")
	  public String coding() {
	    return "books/testIndex";
	  }
	   
	  @ResponseBody
	  @RequestMapping(value = "/books/fileUpload", method = RequestMethod.POST)
	  public boolean fileUpload(MultipartHttpServletRequest multipartRequest) {
	    // 추가데이터 테스트
	    System.err.println(multipartRequest.getParameter("temp"));
	    String filePath = "c:\\Spring\\upload";
	    Map<String, List<String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
	    // 실제저장파일명과 원본파일명 DB저장처리
	    System.err.println("업로드성공"+fileNames.toString());
	    //파일 업로드 성공여부 체크
	    return true;
	  }
	  
}