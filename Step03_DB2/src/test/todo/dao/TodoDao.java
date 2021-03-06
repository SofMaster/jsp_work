package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
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
					+ " VALUES(todo_seq.NEXTVAL, ?, TO_DATE(?, 'YYYY-MM-DD HH24:MI'), TO_DATE(?, 'YYYY-MM-DD HH24:MI'), SYSDATE )";
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
					+ " SET content=?, start_date=TO_DATE(?,'YY.MM.DD HH24:MI'), final_date=TO_DATE(?,'YY.MM.DD HH24:MI'),regdate=SYSDATE"
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
			String sql = "SELECT content,TO_CHAR(start_date,'YY.MM.DD HH24:MI') AS start_date,TO_CHAR(final_date,'YY.MM.DD HH24:MI') AS final_date,TO_CHAR(regdate,'YY.MM.DD HH24:MI') AS regdate"
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
		         String sql = "SELECT num,content,TO_CHAR(start_date,'YY.MM.DD HH24:MI') AS start_date,TO_CHAR(final_date,'YY.MM.DD HH24:MI') AS final_date,TO_CHAR(regdate,'YY.MM.DD HH24:MI') AS regdate"
							+ " FROM todo"
							+ " ORDER BY num ASC";
		         pstmt = conn.prepareStatement(sql);
		         //? ??? ??? ???????????????
		         
		         //query ??? ???????????? ?????? ???????????? 
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
	
	   public List<TodoDto> getList(TodoDto dto){
		      List<TodoDto> list=new ArrayList<TodoDto>();
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         //Connection ????????? ????????? ???????????? 
		         conn = new DbcpBean().getConn();
		         //????????? sql ??? ??????
		         String sql = "SELECT *" + 
		               " FROM" + 
		               "   (SELECT result1.*, ROWNUM rnum" + 
		               "   FROM" + 
		               "      (SELECT num,content,start_date,final_date,regdate" + 
		               "      FROM todo" + 
		               "      ORDER BY num ASC) result1)" + 
		               " WHERE rnum BETWEEN ? AND ?";
		         pstmt = conn.prepareStatement(sql);
		         //? ??? ??? ???????????????
		         pstmt.setInt(1, dto.getStartRowNum());
		         pstmt.setInt(2, dto.getEndRowNum());
		         //query ??? ???????????? ?????? ???????????? 
		         rs = pstmt.executeQuery();
		         while (rs.next()) {
		            TodoDto dto2=new TodoDto();
		            dto2.setNum(rs.getInt("num"));
					dto2.setContent(rs.getString("content"));
					dto2.setStart_date(rs.getString("start_date"));
					dto2.setFinal_date(rs.getString("final_date"));
					dto2.setRegdate(rs.getString("regdate"));
		            list.add(dto2);
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
		   
	   public int getCount() {
			
			int count=0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection ????????? ????????? ???????????? 
				conn = new DbcpBean().getConn();
				//????????? sql ??? ??????
				String sql = "SELECT MAX(ROWNUM) AS num FROM todo";
				pstmt = conn.prepareStatement(sql);
				//? ??? ??? ???????????????

				//query ??? ???????????? ?????? ???????????? 
				rs = pstmt.executeQuery();
				while (rs.next()) {
					count=rs.getInt("num");
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

			return count;
		}
	
	
	
	
	
	
}
