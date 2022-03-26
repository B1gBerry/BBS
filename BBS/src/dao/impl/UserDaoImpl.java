package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.UserDao;
import entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	private Connection        conn  = null;        
	private PreparedStatement pstmt = null;       
	private ResultSet         rs    = null;       

    public int addUser(User user) {
        String   sql  = "insert into TBL_USER(uName,uPass,gender,head,regTime) values(?,?,"+user.getGender()+",?,?)";
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());        
        String[] parm = { user.getUserName(), user.getUserPass(),user.getHead(),time };
        return this.executeSQL(sql, parm);       
    }    

    public int updateUser(User user){
        String   sql  = "update TBL_USER set upass=? where uname=?";
        String[] parm = { user.getUserPass(),user.getUserName() };
        return this.executeSQL(sql, parm);      
    }
    
    public User findUser(String userName) {
        String sql  = "select * from TBL_USER where uName='"+userName+"'";
        User   user = null;
        try {
            conn  = this.getConn();                       
            pstmt = conn.prepareStatement(sql);        
            rs = pstmt.executeQuery();                  
            while( rs.next() ) {
                user = new User();
                user.setUserId( rs.getInt("uId") );
                user.setUserName( rs.getString("uName") );
                user.setUserPass( rs.getString("uPass") );
                user.setGender(rs.getInt("gender"));
                user.setHead( rs.getString("head") );
                user.setRegTime( rs.getDate("regTime") );
            }
        } catch (Exception e) {
            e.printStackTrace();                  
        } finally {
            this.closeAll(conn, pstmt, rs);
        }
        return user;
    }
    

    public User findUser(int uId) {
        String sql  = "select * from TBL_USER where uId=?";
        User   user = null;
        try {
            conn  = this.getConn();                        
            pstmt = conn.prepareStatement(sql);               
            pstmt.setInt(1, uId);                     
            rs    = pstmt.executeQuery();                     
            while( rs.next() ) {
                user = new User();
                user.setUserId( rs.getInt("uId") );
                user.setUserName( rs.getString("uName") );
                user.setUserPass( rs.getString("uPass") );
                user.setGender(rs.getInt("gender"));
                user.setHead( rs.getString("head") );
                user.setRegTime( rs.getDate("regTime") );
            }
        } catch (Exception e) {
            e.printStackTrace();                    
        } finally {
            this.closeAll(conn, pstmt, rs);         
        }        
        return user;
    }

}
