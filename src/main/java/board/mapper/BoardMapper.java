package board.mapper;

import java.util.List;

import board.vo.BoardVO;

public interface BoardMapper {

	public void create(BoardVO board) throws Exception;

	public List<BoardVO> list() throws Exception;

}
