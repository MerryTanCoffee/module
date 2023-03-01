package board.service;

import java.util.List;

import board.vo.BoardVO;

public interface IBoardService {

	public void register(BoardVO board) throws Exception;

	public List<BoardVO> list() throws Exception ;

}
