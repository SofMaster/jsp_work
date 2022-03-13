package test.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import test.dao.MemberDao;

public class MainClass02 {
	public static void main(String[] args) {
		// 회원 정보를 추가하고 삭제하려면?? MemberDaoImpl 클래스를 import 하지 않고 할 수 있을까?
		
		// 불가능 하지 않을까? 만약 성공한다면?
		ApplicationContext context=new ClassPathXmlApplicationContext("test/main/init.xml");
		MemberDao dao=context.getBean(MemberDao.class);
		
		dao.insert();
		dao.delete();
	}
}
 