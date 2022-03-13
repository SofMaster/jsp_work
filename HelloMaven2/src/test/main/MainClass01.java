package test.main;

import test.dao.FriendDao;

public class MainClass01 {
	public static void main(String[] args) {
		//친구정보를 추가하고 수정해 보세요.
		FriendDao dao = new FriendDao();
		dao.insert();
		dao.update();
	}
}
