package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class BbsDAO {
	// Connection, ResultSet 객체 생성
    private Connection conn;
    private ResultSet rs;
    
    // DB와 연결
    public BbsDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/BBS";
            String dbID = "root";
            String dbPassword = "0000";
            Class.forName("com.mysql.jdbc.Driver");
            // 주어진 값들로 DB Connection
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        // 예외처리
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getDate() {
    	// 현재 시간 가져오기
    	String SQL = "SELECT NOW()";
    	try {
    		// SQL Connection
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		// ResultSet 객체에 값을 담아줌
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return rs.getString(1);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return "";
    }
    
    public int getNext() {
    	String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
    	try {
    		// PreparedStatement호출, SQL쿼리 사용
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		// ResultSet 객체에 값을 담아줌
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			// 다음 게시글 번호 지정
    			return rs.getInt(1) + 1;
    		}
    		// 게시글 조회 성공
    		return 1;
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	// 게시글 조회 실패
    	return -1;
    }
    
    public int write(String bbsTitle, String userID, String bbsContent)  {
    	// 게시물 작성 필수 요소 insert
    	String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
    	try {
    		// PreparedStatement호출, SQL Connection
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		// 게시물 필수 값 삽입
    		pstmt.setInt(1, getNext());
    		pstmt.setString(2, bbsTitle);
    		pstmt.setString(3, userID);
    		pstmt.setString(4, getDate());
    		pstmt.setString(5, bbsContent);
    		pstmt.setInt(6, 1);
    		// 게시물 행 업데이트
    		return pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	// 게시글 작성 실패
    	return -1;
    }
    
    public ArrayList<Bbs> getList(int pageNumber) {
    	// 게시물 내림차순으로 정렬
    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
    	ArrayList<Bbs> list = new ArrayList<Bbs>();
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		// 한 페이지의 게시물 수를 10개로 설정
    		pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
    		// ResultSet에 값 담기
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			Bbs bbs = new Bbs();
    			bbs.setBbsID(rs.getInt(1));
    			bbs.setBbsTitle(rs.getString(2));
    			bbs.setUserID(rs.getString(3));
    			bbs.setBbsDate(rs.getString(4));
    			bbs.setBbsContent(rs.getString(5));
    			bbs.setBbsAvailable(rs.getInt(6));
    			// list에 현재 값 추가
    			list.add(bbs);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	// 값을 추가한 list 반환
    	return list;
    }
    
    public boolean nextPage(int pageNumber) {
    	// 페이징 처리
    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
    		rs = pstmt.executeQuery();
    		if (rs.next()) {
    			// 페이징 처리
    			return true;
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	// 페이징 처리 안함
    	return false;
    }
    
    public Bbs getBbs(int bbsID) {
    	// 게시물 불러오기
    	String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, bbsID);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			Bbs bbs = new Bbs();
    			bbs.setBbsID(rs.getInt(1));
    			bbs.setBbsTitle(rs.getString(2));
    			bbs.setUserID(rs.getString(3));
    			bbs.setBbsDate(rs.getString(4));
    			bbs.setBbsContent(rs.getString(5));
    			bbs.setBbsAvailable(rs.getInt(6));
    			return bbs;
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    public int update(int bbsID, String bbsTitle, String bbsContent) {
    	// 게시물 수정 - 게시물 찾기
    	String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
    	try {
    		// 게시물 수정
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, bbsTitle);
    		pstmt.setString(2, bbsContent);
    		pstmt.setInt(3, bbsID);
    		return pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	// 수정 실패
    	return -1;
    }
    
    public int delete(int bbsID) {
    	// 게시물 삭제
    	String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
    	try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	// 삭제 실패
    	return -1;
    }
}