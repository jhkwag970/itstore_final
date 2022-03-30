package com.group6.shopping.boards.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;

@Controller
@RequestMapping("/boards")
public class BoardsController {

    @PostMapping("/somethingform")
    public String something(String something){
        System.out.println(something + "도착");
        return "home";
        
    }
        @Autowired
    	private BoardsService boardsservice;
    	
    	
    	 //이벤트 메인페이지 진행중게시글 목록조회
    	  
    	  @GetMapping(value = "/event") 
    	  public String EventBoardslist(Model model)
    	  throws Exception { System.out.println("/event");
    	  model.addAttribute("eventboardlist", boardsservice.EventBoardslist());
    	  return "boards/event"; 
    	  }
    	 
    	  //이벤트 메인페이지 진행중게시글 목록조회
    	  
    	  @GetMapping(value = "/endevent") 
    	  public String EndEventBoardslist(Model model) throws Exception 
    	  {System.out.println("/endevent");
    	  model.addAttribute("endeventboardlist", boardsservice.EndEventBoardslist());
    	  return "boards/endevent"; 
    	  }
    	
    	//리뷰 메인페이지 게시글 목록조회
    		@GetMapping(value = "/review")
    		public String ReviewBoardslist(Model model) throws Exception {
    			System.out.println("/review");
    			model.addAttribute("reviewboardlist", boardsservice.ReviewBoardslist());
    			
    			return "boards/review";
    		}
    		
    	//게시판글 조회
    	@RequestMapping(value = "/readView")
    	public String read(BoardsVO boardsVO, Model model) throws Exception{
    		System.out.println("/readView22");
    		System.out.println("/boardsVO : "+boardsVO.getBoard_id());
    		System.out.println("/boardsVO : "+boardsVO.getBoard_type());
    		
    		model.addAttribute("read", boardsservice.read(boardsVO.getBoard_id()));
    		
    		return "boards/readView";
    	}
    	
    	
    	@RequestMapping(value = "/insertView")
    	public String insertView(BoardsVO boardsVO, Model model) throws Exception{
    		
    		System.out.println("/insertView");
    		return "boards/insertView";
    	}
    	
    	@RequestMapping(value = "/eventinsertView")
    	public String eventinsertView(BoardsVO boardsVO, Model model) throws Exception{
    		
    		System.out.println("/insertView");
    		return "boards/eventinsertView";
    	}
    		
    		
    	@RequestMapping(value = "/eventinsert")
    	public String eventinsert(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		System.out.println("/eventinsert클릭");
    		System.out.println("/eventinsert클릭"+boardsVO.getBoard_type());
    		boardsservice.eventinsert(boardsVO);
    		return "redirect:"+boardsVO.getBoard_type();
    	}
    	
    	
    	@RequestMapping(value = "/reviewinsert")
    	public String insert(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		System.out.println("/reviewinsert클릭");
    		boardsservice.reviewinsert(boardsVO);
    		return "redirect:"+boardsVO.getBoard_type();
    	}
    	
    	@RequestMapping(value = "/delete")
    	public String delete(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception{
    		
    		boardsservice.delete(boardsVO.getBoard_id());
    		System.out.println(boardsVO.getBoard_id());
    		System.out.println(boardsVO.getBoard_type());
    		return "redirect:"+boardsVO.getBoard_type(); 
    	}
    	
    	
    }

