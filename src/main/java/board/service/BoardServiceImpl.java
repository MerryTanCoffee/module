package board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import board.mapper.BoardMapper;
import board.vo.BoardVO;

@Service
public class BoardServiceImpl implements IBoardService {

	@Inject
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) throws Exception {
		mapper.create(board);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return mapper.list();
	}

}
