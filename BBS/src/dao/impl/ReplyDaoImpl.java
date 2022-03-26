package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ReplyDao;
import entity.Reply;

public class ReplyDaoImpl extends BaseDao implements ReplyDao {
	private Connection        conn  = null;              
	private PreparedStatement pstmt = null;              
	private ResultSet         rs    = null ;             
  
    public int addReply(Reply reply) {
        String   sql  = "insert into TBL_REPLY(title,content,publishTime,modifyTime,uid,topicId) values(?,?,?,?," + reply.getUserId() + "," + reply.getTopicId() + ")";
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());       
        String[] parm = { reply.getTitle(), reply.getContent(), time, time };        
        return this.executeSQL(sql, parm);              
    }

    public int deleteReply(int replyId) {
        String sql = "delete from TBL_REPLY where replyId=" + replyId;
        return this.executeSQL(sql, null);              
    }

    public int updateReply(Reply reply) {
        String   sql  = "update TBL_REPLY set title=?, content=?, modifyTime=? where replyId="+reply.getReplyId();
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());      
        String[] parm = { reply.getTitle(), reply.getContent(), time };
        return this.executeSQL(sql, parm);               
    }

    public List findListReply(int page, int topicId) {
    	List list  = new ArrayList();                 
        int rowBegin=0;                                                                          
        if( page > 1 ) {
             rowBegin = 10 * (page-1);    
             }
		String sql = "select top 20 * from TBL_REPLY where topicId=" + topicId 
        		+ " and topicId not in(select top "+ rowBegin 
        		+ " topicId from TBL_TOPIC where topicId=" + topicId 
        		+ " order by publishTime desc )order by publishTime desc";
		try {
            conn = this.getConn();                               
			pstmt = conn.prepareStatement(sql);                   
			rs = pstmt.executeQuery();
            while ( rs.next() ) {
                Reply reply = new Reply();                              
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setModifyTime(rs.getDate("modifyTime"));
                reply.setTopicId(rs.getInt("topicId"));
                reply.setUserId(rs.getInt("uid"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();                       
        } finally {
            this.closeAll(conn, pstmt, rs);            
        }
		return list;
    }

    public int findCountReply(int topicId){
        int              count = 0;                    
        Connection        conn  = null;                     
        PreparedStatement pstmt = null;                     
        ResultSet      rs    = null;                     
        String            sql   = "select count(*) from TBL_REPLY where topicId=" + topicId;
		try {
            conn  = this.getConn();
 
			pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            while( rs.next() ) {
                count = rs.getInt(1);
            }
        } catch ( Exception e) {
            e.printStackTrace();                        
        } finally {
            this.closeAll(conn, pstmt, rs);             
        }
        return count;
    }


    public Reply findReply(int replyId) {
        String sql = "select * from TBL_REPLY where replyId=?";
        Reply reply = null;
        pstmt = null;
		try {
            conn  = this.getConn();                           
            pstmt = conn.prepareStatement(sql);            
            pstmt.setInt(1, replyId);              
            rs    = pstmt.executeQuery();         
            while ( rs.next() ) {
                reply = new Reply();              
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setModifyTime(rs.getDate("modifyTime"));
                reply.setUserId(rs.getInt("uId"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   
        } finally {
            this.closeAll(conn, pstmt, rs);       
        }
        return reply;
    }

}
