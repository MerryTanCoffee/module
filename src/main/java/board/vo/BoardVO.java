package board.vo;

import java.util.Date;


import lombok.Data;

@Data
public class BoardVO {
	private int boNo;
	private String title;
	private String content;
	private String writer;
	private int hit;
	private Date regDate;
}
