package com.bit.project.model.entity;

public class Paging {

	private BoardVo boardVo;
	private int totalCount;   // �� �Խñ� ��
	private int startPage;   // ���� ������
	private int endPage;   // ����¡ ������ 5 �̹Ƿ� startPage+5 �� �ȴ�
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;   // ������ ��ư ��� ����
	
	
	
	public BoardVo getBoardVo() {
		return boardVo;
	}
	public void setBoardVo(BoardVo boardVo) {
		this.boardVo = boardVo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pageData();   // �޼ҵ带 ȣ���Ͽ�, ����¡ �۾�
	}
	
	private void pageData() {
		endPage=(int)(Math.ceil(boardVo.getPage()/(double)displayPageNum)*displayPageNum);   // ceil : �ø�
		startPage=(endPage-displayPageNum+1);
		if(startPage<=0) startPage=1;   // ������ ù�������� ���
		
//		����¡ ��������ȣ ���� (endPage �� �ƴ϶�, ���� �Խñۿ� ���� ������ ��ȣ ���
		int endPaging=(int)(Math.ceil(totalCount/(double)boardVo.getPageCount()));
		if(endPage>endPaging) {
			endPage=endPaging;
		}
		prev=startPage==1? false:true;   // 1 ���������� prev �� ����
		next=endPage*boardVo.getPageCount()<totalCount? true:false;   // �Խñۼ��� ����¡���� ũ�� next ����
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}


}
