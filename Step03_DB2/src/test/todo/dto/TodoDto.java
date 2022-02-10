package test.todo.dto;



public class TodoDto {
	

	private int num;
	private String content;
	private String start_date;
	private String final_date;
	private String regdate;
	
	public TodoDto() {};
	
	public TodoDto(int num, String content, String start_date, String final_date, String regdate) {
		super();
		this.num = num;
		this.content = content;
		this.start_date = start_date;
		this.final_date = final_date;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getFinal_date() {
		return final_date;
	}

	public void setFinal_date(String final_date) {
		this.final_date = final_date;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
