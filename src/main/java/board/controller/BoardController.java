package board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.service.IBoardService;
import board.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Inject
	private IBoardService boardService;
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String RegisterForm(BoardVO board, Model model) throws Exception {
		log.info("RegisterForm() : ");
		model.addAttribute("board",board);
		
		return "board/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String Register(BoardVO board, Model model) throws Exception {
		log.info("Register() : ");
		
		// 등록 기능 요청(서비스)
		boardService.register(board);
		
		if(board.getBoNo()>0) {
			// 띄어쓰기 있으면 안됨
			return "redirect:/board/read?boNo=" + board.getBoNo();
		}
	
		model.addAttribute("msg","등록 완료");
		return "board/success";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception{
		log.info("boardList : ");
		List<BoardVO> boardList = boardService.list();
		model.addAttribute("list",boardList);
		return "board/list";
	}
	
}
