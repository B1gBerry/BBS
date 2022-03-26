package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.TopicDao;
import entity.Topic;

public class TopicDaoImpl extends BaseDao implements TopicDao {

	private Connection conn  = null;           
	private PreparedStatement pstmt = null;          
	private ResultSet   rs    = null ;           
 
    public int addTopic(Topic topic) {
    	System.out.println(topic.getTitle());
        String   sql  = "insert into TBL_TOPIC(title,content,publishTime,modifyTime,uId,boardId) values(?,?,?,?," + topic.getUserId() + "," + topic.getBoardId() + ")";
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());   
        String[] parm = { topic.getTitle(), topic.getContent(), time, time };        
        return this.executeSQL(sql, parm);        
    }

    public int deleteTopic(int topicId) {
        String sql = "delete from TBL_TOPIC where topicId=" + topicId;
        return this.executeSQL(sql, null);        
    }

    public int updateTopic(Topic topic) {
        String   sql  = "update TBL_TOPIC set title=?, content=?, modifyTime=? where topicId="+topic.getTopicId();
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());       
        String[] parm = { topic.getTitle(), topic.getContent(), time };
        return this.executeSQL(sql, parm);        
    }

    public Topic findTopic(int topicId) {
        String sql  = "select * from TBL_TOPIC where topicId=?";
        Topic topic = null;
        try {
            conn  = this.getConn();                 
            pstmt = conn.prepareStatement(sql);    
            pstmt.setInt(1, topicId);              
            rs    = pstmt.executeQuery();          
            while ( rs.next() ) {
                topic = new Topic();              
                topic.setTopicId(rs.getInt("topicId"));
                topic.setTitle(rs.getString("title"));
                topic.setContent(rs.getString("content"));
                topic.setPublishTime(rs.getDate("publishTime"));
                topic.setModifyTime(rs.getDate("modifyTime"));
                topic.setUserId(rs.getInt("uId"));
            }
        } catch (Exception e) {
            e.printStackTrace();                 
        } finally {
            this.closeAll(conn, pstmt, rs);    
        }
        return topic; 
    }

    public List findListTopic(int page, int boardId) {
        List list    = new ArrayList();                    
        int rowBegin = 0;                               
        if( page > 1 ) {
            rowBegin = 20 * (page-1);              
            }
        String sql = "select top 20 * from TBL_TOPIC where boardId=" + boardId 
        		+ " and topicId not in(select top "+ rowBegin 
        		+ " topicId from TBL_TOPIC where boardId=" + boardId 
        		+ " order by publishTime desc )order by publishTime desc";
        try {
            conn  = this.getConn();                     
            pstmt = conn.prepareStatement(sql);          
            rs    = pstmt.executeQuery();          
            while ( rs.next() ) {
                Topic topic = new Topic();       
                topic.setTopicId(rs.getInt("topicId"));
                topic.setTitle(rs.getString("title"));
                topic.setPublishTime(rs.getDate("publishTime"));
                topic.setModifyTime(rs.getDate("modifyTime"));
                topic.setUserId(rs.getInt("uId"));
                list.add(topic);
            }
        } catch ( Exception e ) {
            e.printStackTrace();                 
        } finally {
            this.closeAll(conn, pstmt, rs);      
        }
        return list;
    }
    

    public int findCountTopic(int boardId) {
        int    count = 0;                         
        String  sql   = "select count(*) from TBL_TOPIC where boardId=" + boardId;
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

}
