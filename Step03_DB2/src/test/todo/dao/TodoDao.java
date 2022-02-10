package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	private TodoDao() {};
	public static TodoDao getInstance() {
		if(dao==null) {
			dao=new TodoDao();
		}
		return dao;
	}
	
	public boolean insert(TodoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "Insert Into todo"
					+ " (num,content,start_date,final_date,regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getStart_date());
			pstmt.setString(3, dto.getFinal_date());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean update(TodoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE todo"
					+ " SET content=?, start_date=?, final_date=?,regdate=SYSDATE"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getStart_date());
			pstmt.setString(3, dto.getFinal_date());
			pstmt.setInt(4, dto.getNum());
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
			
		
	}
   public boolean delete(int num) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         String sql = "DELETE FROM todo"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         flag = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
         }
      }
      if (flag > 0) {
         return true;
      } else {
         return false;
      }
   }
	
	public TodoDto select(int num) {
		TodoDto dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT content,start_date,final_date,regdate"
					+ " FROM todo"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto=new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setFinal_date(rs.getString("final_date"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			try {
				 if (rs != null)rs.close();
		         if (pstmt != null)pstmt.close();
		         if (conn != null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	   public List<TodoDto> selectAll(){
		      List<TodoDto> list=new ArrayList<TodoDto>();
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         conn = new DbcpBean().getConn();
		         String sql = "SELECT num,content,start_date,final_date,regdate"
							+ " FROM todo"
							+ " ORDER BY num ASC";
		         pstmt = conn.prepareStatement(sql);
		         //? 에 값 바인딩하기
		         
		         //query 문 수행하고 결과 받아오기 
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		            TodoDto dto=new TodoDto();
		            dto.setNum(rs.getInt("num"));
					dto.setContent(rs.getString("content"));
					dto.setStart_date(rs.getString("start_date"));
					dto.setFinal_date(rs.getString("final_date"));
					dto.setRegdate(rs.getString("regdate"));
		            list.add(dto);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         try {
		            if (rs != null)
		               rs.close();
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close();
		         } catch (Exception e) {
		         }
		      }

		      
		      return list;
		   }
	
	
	
	
	
	
	
	
	
}
