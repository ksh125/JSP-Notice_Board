package user;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
public class UserDAO {
    // Connection, PreparedStatement, ResultSet 객체 생성
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    // DB와 연결
    public UserDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bbs";
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
    
    // 로그인
    public int login(String userID, String userPassword) {
    	// SQL문: 해당 패스워드와 아이디를 가진 row를 추적
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        
        try {
        	// SQL Connection
        	pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            // ResultSet 객체에 값을 담아줌
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)) {
                	// 로그인
                    return 1;
                } else {
                	// 패스워드가 같지 않음
                    return 0;
                }
            }
            // 아이디가 존재하지 않음
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Database 오류
        return -2;
    }
    
    // SQL 회원가입 - 테이블 row추가
    public int join(User user) {
    	// 값 대입
    	String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
    	try {
    		// DB와 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			// 테이블 업데이트
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("error #1");
			e.printStackTrace();
		}
    	// 회원가입 실패(주어진 값이 부족하거나 용량 초과)
    	return -1;
    }
 
}
