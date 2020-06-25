/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import model.ChatHistoryInfo;
import model.ChatHistory_List;
import model.Chat_List;
import model.Notes_info;
import model.Notes_list;
import model.Profile_info;
import model.Profile_list;
import model.User_List;
import model.User_info;

/**
 *
 * @author xiangmacbook
 */
public class DBconnect extends HttpServlet {
        public Connection conn = null;	
	public Statement stmt = null;
        public Connection conn2 = null;	
	public Statement stmt2 = null;
        public ResultSet rs = null;
        public ResultSet rs2 = null;
       
        private static String dbUrl = "jdbc:mysql://worldchatdb.mysql.database.azure.com/world_chatdb";
        private static String dbUser = "anhaoxiang@worldchatdb";	
	private static String dbPwd = "Xah19960807";	
        private static String dbClassName = "com.mysql.jdbc.Driver";
//        private static String dbUrl = "jdbc:mysql://localhost:3306/world_chatDB";
//	private static String dbUser = "root";	
//		
        
        ////////////////////////////////////////////////
        //Encryption and Decryption
        //
        ////////////////////////////////////////////////
        private static SecretKeySpec secretKey;
        private static byte[] key;
        
        public static void setKey(String k) {
            MessageDigest sha;
            try {
            key = k.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16);
            secretKey = new SecretKeySpec(key, "AES");
            }
            catch (NoSuchAlgorithmException e) {
            } 
            catch (UnsupportedEncodingException ex) {
                Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        public static String encryption(String strToEncrypt, String secret) {
            try
            {
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
            }
            catch (NullPointerException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | UnsupportedEncodingException | IllegalBlockSizeException | BadPaddingException e)
            {
                System.out.println("Error while encrypting: " + e.toString());
            }
            return null;
        }
        
        public static String decryption(String strToDecrypt, String secret) {
            try
            {
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                cipher.init(Cipher.DECRYPT_MODE, secretKey);
                return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
            }
            catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e)
            {
                System.out.println("Error while decrypting: " + e.toString());
            }
            return null;
        }
        
        //Set Key
        final String k = "123456";
        
        ////////////////////////////////////////////////
        //End of Encryption and Decryption
        //
        ////////////////////////////////////////////////
        
        public static Connection getConnection() {
                DataSource ds;
                Context context;
		Connection conn = null;
		try {   
                       
                        InitialContext ic = new InitialContext();

                        context = (Context) ic.lookup("java:comp/env");

                        ds = (DataSource) context.lookup("connpool");

                        conn = ds.getConnection();


		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err.println("DbConnectionManager.getConnection():" + dbClassName + "\r\n :" + dbUrl + "\r\n "
					+ dbUser + "/" + dbPwd);
		}
		return conn; 
	}
        
        public static void main(String[] args) {
		if (getConnection() != null) {
			System.out.print("database connected");
		}
	}
        
        public int executeUpdate(String sql) {
		int result = 0;// 更新数据的记录条数
		try {// 捕捉异常
			conn = getConnection();// 获取数据库连接
			// 创建用于执行SQL语句的Statement对象
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);// 执行SQL语句
		} catch (SQLException ex) {// 处理异常
			result = 0;// 指定更新数据的记录条数为0，表示没有更新数据
			ex.printStackTrace();// 输出异常信息
		}
		try {// 捕捉异常
			stmt.close();// 关闭用于执行SQL语句的Statement对象
		} catch (SQLException ex1) {// 处理异常
			ex1.printStackTrace();// 输出异常信息
		}
		return result;// 返回更新数据的记录条数
	}


	public ResultSet executeQuery(String sql) {
		try {// 捕捉异常
                        //System.out.println("Before");
			conn = getConnection();// 获取数据库连接
                        //System.out.println("after");
			// 创建用于执行SQL语句的Statement对象
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                       
			rs = stmt.executeQuery(sql);// 执行SQL语句
		} catch (SQLException ex) {// 处理异常
			ex.printStackTrace();// 输出异常信息
		}
		return rs;// 返回查询结果
	}
        
        public ResultSet executeQuery2(String sql) {
		try {// 捕捉异常
                        //System.out.println("Before");
			conn2 = getConnection();// 获取数据库连接
                        //System.out.println("after");
			// 创建用于执行SQL语句的Statement对象
			stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                       
			rs2 = stmt2.executeQuery(sql);// 执行SQL语句
		} catch (SQLException ex) {// 处理异常
			ex.printStackTrace();// 输出异常信息
		}
		return rs2;// 返回查询结果
	}
        ////////////////////////////////////////////////////////////////////////
        
        
        
        public void online(String uid){
            String query = "UPDATE user SET status = 1 where id =" + uid;
            executeUpdate(query);
        }
        
        public void offline(String uid){
            String query = "UPDATE user SET status = 0 where id =" + uid;
            executeUpdate(query);
        }
        
        public boolean Regis(String email, String UserName , String PWD, String lang, String country, String age,String sex, String description){
            String enc_email = encryption(email, k);
            
            String enc_PWD = encryption(PWD, k);
            
            String enc_UserName = encryption(UserName, k);
            
            String enc_lang = encryption(lang, k);
            
            String enc_country = encryption(country, k);
            
            String enc_sex = encryption(sex, k);
            
       
            
            String profile_pic = "";
            String query = "INSERT INTO user(email, password, userName, profile_pic, language, country, sex, age) VALUES ('"+
                    enc_email+"', '"+enc_PWD+"', '"+ enc_UserName + "', '" + profile_pic + "', '" + enc_lang + "', '" + enc_country+"', '" +
                    enc_sex + "', " + age + ")";
            
            String test_query = "SELECT * FROM user where email='" + enc_email + "'";
            System.out.println(query);

            boolean flag = false;
            try{
               rs = executeQuery(test_query);
               if(rs.next()){
                 
              } else {
                   executeUpdate(query);
                   flag =  true;
               } 
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            
            if(flag){
                 try{
                    rs = executeQuery(test_query);
                    if(rs.next()){
                            int uid = rs.getInt("id");
                            String profile_query = "INSERT INTO user_profile(id, userName, description, location, birth) VALUES (" + 
                                    uid + ", '" + enc_UserName + "', '" + description + "', '" + enc_country + "', "+ age + ")";
                            executeUpdate(profile_query);
                        } 
                    } catch(SQLException ex){

                    } finally {
                        close();
                    }
            }
            
            return flag;
        }
        
         public List<String> getData(String keyword) throws SQLException{
             
		List<String> list = new ArrayList<String>();
                String enc_keyword = encryption(keyword, k);
                
                String query = "SELECT * FROM user where userName LIKE'" + enc_keyword + "%" + "'";
                rs =  executeQuery(query);
                int i = 0;
                if(rs.next()){
                    
                    String userName = decryption(rs.getString("userName"), k);
                    list.add(userName);
                    while(rs.next()){
                        if(i <= 10){
                            userName = decryption(rs.getString("userName"), k);
                            list.add(userName);
                        }
                        i++;
                    }
                } else {
                    list.add("no result founded");
                }
                close();
               
		return list;
        }
        
        public Chat_List FindMatch(String language, String country, String sex, String minAge, String maxAge, String uid){
            Chat_List list = new Chat_List();
            
            ArrayList MatchSet = new ArrayList();
            ArrayList<String> flist = getFriendListArray(uid);
            int i = 0;
            
            String enc_language = encryption(language, k);
            String enc_country = encryption(country, k);
            String enc_sex = encryption(sex, k);
            String testQuery = "select * from user where country='" + enc_country + "'"; 
            
            if(sex == null){
                return list;
            }

            String MatchQuery = " SELECT * FROM user WHERE (country = '" + enc_country + "'" 
                    + " AND " + " language = " + "'" + enc_language + "'" + " AND " + 
                    "sex = '" + enc_sex  + "' AND " + "age >= " + minAge + " AND " + "age <= " + maxAge + ")" ;
            try{
               rs = executeQuery(MatchQuery);
                while(rs.next()){
                        boolean flag = true;
                        i = 0;
                        while(i < flist.size()){
                            if(String.valueOf(rs.getInt("id")).equals(flist.get(i))){
                                flag = false;
                            }
                            i++;
                        }
                        if(!String.valueOf(rs.getInt("id")).equals(uid) && flag){
                                User_info users = new User_info();
                                String dec_language = decryption(rs.getString("language"), k);
                                String dec_userName = decryption(rs.getString("userName"), k);
                                
                                users.setFID(rs.getInt("id"));
                                users.setLanguage(dec_language);
                                users.setProfilePic(rs.getString("profile_pic"));
                                users.setUserName(dec_userName);
                                list.setList(users);
                        }
                       
                   }
//               if(rs.next()){
//                   User_info users = new User_info();
//                   users.setFID(rs.getInt("id"));
//                   users.setLanguage(rs.getString("language"));
//                   users.setProfilePic(rs.getString("profile_pic"));
//                   users.setUserName(rs.getString("userName"));
//                   list.setList(users);
//                   
//                   
//                   while(rs.next()){
//                        User_info users2 = new User_info();
//                        users.setFID(rs.getInt("id"));
//                        users.setLanguage(rs.getString("language"));
//                        users.setProfilePic(rs.getString("profile_pic"));
//                        users.setUserName(rs.getString("userName"));
//                        list.setList(users2);
//                   }
//
//               } else {
//                   
//               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
        
        public void Add2ChatList(Integer id){
            String Query = "select * from user where id='" + id + "'"; 
            String country;
            String language;
            String userName;
            String profile_pic;
            String sex;
            Integer age;
            try{
               rs = executeQuery(Query);
               if(rs.next()){
//                  country = rs.getString("country");
//                  language = rs.getString("language");
//                  userName = rs.getString("userName");
//                  profile_pic = rs.getString("profile_pic");
                  country = encryption(rs.getString("country"), k);
                  language = encryption(rs.getString("language"), k);
                  userName = encryption(rs.getString("userName"), k);
                  profile_pic = encryption(rs.getString("profile_pic"), k);
                  
                  sex = rs.getString("sex");
                  age = rs.getInt("age");
                  long timestamp = System.currentTimeMillis();
                                    
                  String Query2 = "INSERT INTO chat_list(id, userName, profile_pic, "
                          + "language, country, sex, age, timestamp) VALUES ( " + id + "," 
                          + "'" + userName + "'" + "," + "'" + profile_pic + "'" + "," + "'" + language + "'" + ","
                          + "'" + country + "'" + ", '" + sex + "' ," + age + "," + timestamp + ")";
//                  System.out.println(Query2);
                  executeUpdate(Query2);
                  
              } 
            } catch(SQLException ex){
                
            } finally {
                close();
            }
        }
        
        public void RemoveFriendList(String uid, String fid){
            String query1 = "delete from friend_list where id = " + uid + " AND fid =" + fid;
            String query2 = "delete from friend_list where id = " + fid + " AND fid =" + uid;
//            System.out.println(query1);
            executeUpdate(query1);
            executeUpdate(query2);
        }
        
        public Chat_List getSearchList(String userName, String uid){
            
            ArrayList<String> flist = getFriendListArray(uid);
            
            Chat_List list = new Chat_List();
            String enc_userName = encryption(userName, k);
            
            String Query = "select * from user where userName = '" + enc_userName + "'" ; 
            try{
               rs = executeQuery(Query);
               while(rs.next()){
                    boolean flag = true;
                    int i = 0;
                    while(i < flist.size()){
                        if(String.valueOf(rs.getInt("id")).equals(flist.get(i))){
                            flag = false;
                        }
                        i++;
                    }
                    if(flag){
                        User_info users = new User_info();
                        
                        users.setLanguage(decryption(rs.getString("language"), k));
                        users.setProfilePic(decryption(rs.getString("profile_pic"), k));
                        users.setUserName(decryption(rs.getString("userName"), k));
                        users.setFID(rs.getInt("id"));
                        list.setList(users);
                    }
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
        
        public void close() {
		try { // 捕捉异常
			if (rs != null) {
				rs.close();// 关闭结果集对象
			}
                        if (rs2 != null) {
				rs2.close();// 关闭结果集对象
			}
//                        if(rset != null){
//                            rset.close();
//                        }
			if (stmt != null) {
				stmt.close(); // 关闭Statement对象
			}
                        if(stmt2 != null){
                            stmt2.close();
                        }
//                        if(stmt3 != null){
//                            stmt3.close();
//                        }
//                        if(stmt4 != null){
//                            stmt4.close();
//                        }
                        if (conn != null) {
				conn.close(); // 关闭数据库连接对象
			}
                        if (conn2 != null) {
				conn2.close(); // 关闭数据库连接对象
			}
//                        if (conn3 != null) {
//				conn3.close(); // 关闭数据库连接对象
//			}
//                        if (conn4 != null) {
//				conn4.close(); // 关闭数据库连接对象
//			}
                       
		} catch (Exception e) {// 处理异常
			e.printStackTrace(System.err);// 输出异常信息
		}
	}
        
        public ArrayList useVaildate(String email, String pwd){
            ArrayList<String> userinfo = new ArrayList();
            String enc_email = encryption(email, k);
            
            String query="select * from user where email='" + enc_email + "'";
            rs = executeQuery(query);
            try{
                while(rs.next()){
                    String dec_pwd = decryption(rs.getString("password"), k);
                    if(dec_pwd.equals(pwd)){
                        userinfo.add(String.valueOf(rs.getInt("id")));
                        userinfo.add(decryption(rs.getString("userName"), k));
                        userinfo.add(decryption(rs.getString("language"), k));
                        userinfo.add(decryption(rs.getString("profile_pic"), k));
                    }
                }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return userinfo;
        }
        public void clearUnread(String uid, String fid){
            String query = "UPDATE friend_list SET unread = 0 where id=" + uid + " AND fid=" +fid; 
            executeUpdate(query);
        }
        
        public void increaseUnread(String uid, String fid){
            String query = "UPDATE friend_list SET unread = unread + 1 where id=" + uid + " AND fid=" +fid; 
            executeUpdate(query);
        }
        
        public Chat_List getFriendList(String id){
            
            Chat_List list = new Chat_List();
            Chat_List offline_list = new Chat_List();
            Chat_List online_list = new Chat_List();
            String Query = "select * from friend_list where id = " + id ; 
            
            try{
               rs = executeQuery(Query);
               
               while(rs.next()){
                  
                  int Status = checkStatus(rs.getInt("fid"));
                 
                  if(Status == 0){
                        User_info users = new User_info();
                        users.setStatus(String.valueOf(Status));
                        users.setFID(rs.getInt("fid"));
                        users.setLanguage(decryption(rs.getString("language"), k));
                        users.setProfilePic(decryption(rs.getString("profile_pic"), k));
                        users.setUserName(decryption(rs.getString("userName"), k));
                        users.setUnread(rs.getInt("unread"));
                        offline_list.setList(users);
                  } else if (Status == 1){
                        User_info users = new User_info();
                       
                        users.setStatus(String.valueOf(Status));
                        users.setFID(rs.getInt("fid"));
                        users.setUnread(rs.getInt("unread"));
                        users.setLanguage(decryption(rs.getString("language"), k));
                        users.setProfilePic(decryption(rs.getString("profile_pic"), k));
                        users.setUserName(decryption(rs.getString("userName"), k));
                        online_list.setList(users);
                  }
      
//                  System.out.println(rs.getInt("fid") + rs.getString("language") + rs.getString("profile_pic") + rs.getString("userName") );
                  
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            
            for(User_info user: online_list.getList()){
                 list.setList(user);
            }
            
            for(User_info user: offline_list.getList()){
                 list.setList(user);
            }
           
            return list;
        }
        
         public int checkStatus(Integer fid){
             String query = "select * from user where id=" + fid + " AND status=" + 1; 
             
             try{
               rs2 = executeQuery2(query);
               if(rs2.next()){
                 return 1;
               }
            } catch(SQLException ex){
                
            } finally {
               
            }
             
             return 0;
         }       
//        public Chat_List getOnlineFriendsList(String id){
//            
//            ArrayList<String> list = getFriendListArray(id);
//            Chat_List list2 = new Chat_List();
//            
//            for(String S : list){
//                
//                String query = "select * from user where id=" + S + " AND status=" + 1;
//               
//                try{
//                    
//                    rs = executeQuery(query);
//                    while(rs.next()){
//                      
//                       User_info users = new User_info();
//                       users.setFID(rs.getInt("id"));
//                       
//                       users.setLanguage(rs.getString("language"));
//                       
//                       users.setProfilePic(rs.getString("profile_pic"));
//                       users.setUserName(rs.getString("userName"));
//                      
//                       users.setStatus(String.valueOf(rs.getInt("status")));
//                       System.out.println(rs.getInt("status"));
//     //                  System.out.println(rs.getInt("fid") + rs.getString("language") + rs.getString("profile_pic") + rs.getString("userName") );
//                       list2.setList(users);
//                    }
//                 } catch(SQLException ex){
//
//                 } finally {
//                     close();
//                 }
//            }
//                       
//            return list2;
//        }
        
//        public Chat_List getOfflineFriendsList(String id){
//            
//            ArrayList<String> list = getFriendListArray(id);
//            Chat_List list2 = new Chat_List();
//            
//            for(String S : list){
//                String query = "select * from user where id=" + S + " AND status=" + 0;
//                try{
//                    rs = executeQuery(query);
//                    while(rs.next()){
//                       User_info users = new User_info();
//                       users.setFID(rs.getInt("fid"));
//                       users.setLanguage(rs.getString("language"));
//                       users.setProfilePic(rs.getString("profile_pic"));
//                       users.setUserName(rs.getString("userName"));
//                       users.setStatus(String.valueOf(rs.getInt("status")));
//     //                  System.out.println(rs.getInt("fid") + rs.getString("language") + rs.getString("profile_pic") + rs.getString("userName") );
//                       list2.setList(users);
//                    }
//                 } catch(SQLException ex){
//
//                 } finally {
//                     close();
//                 }
//            }
//                       
//            return list2;
//        }
        
        
        public ArrayList getFriendListArray(String id){
            
            ArrayList list = new ArrayList();
            String Query = "select * from friend_list where id = " + id ; 
            
            try{
               rs = executeQuery(Query);
               while(rs.next()){
                  list.add(String.valueOf(rs.getInt("fid")));
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
                
        public Chat_List getOneFriend(String id, String fid){
            
            Chat_List list = new Chat_List();
            String Query = "select * from friend_list where id = " + id + " AND fid =" + fid; 
//            System.out.println("This " + Query);
            try{
               rs = executeQuery(Query);
               while(rs.next()){
                  String dec_lang = decryption(rs.getString("language"), k);
                  String dec_userName = decryption(rs.getString("userName"), k);
                  String dec_profile = decryption(rs.getString("profile_pic"), k);
                  
                  User_info users = new User_info();
                  users.setFID(rs.getInt("fid"));
                  users.setLanguage(dec_lang);
                  users.setProfilePic(dec_profile);
                  users.setUserName(dec_userName);
//                  System.out.println(rs.getInt("fid") + rs.getString("language") + rs.getString("profile_pic") + rs.getString("userName") );
                  list.setList(users);
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
                
        public void InsertFriendList(String id, String fid, String lang, String userName, String Profile){
            String FLang="", FProfile_pic="", FuserName="";
            String query1 = "select * from user where id = " + fid;
            System.out.println(query1);
            try{
               rs = executeQuery(query1);
               while(rs.next()){
                  FLang= rs.getString("language");
                  FProfile_pic = rs.getString("profile_pic");
                  FuserName = rs.getString("userName");
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            boolean flag = true;
            try{
               String query3 = "select * from friend_list where id = " + id ;
               rs2 = executeQuery(query3);
               
               while(rs2.next()){
                   Integer fids = rs2.getInt("fid");
                   if(fids == Integer.valueOf(fid)){
                       flag = false;
                   }
               }
               
            } catch(SQLException ex){
                
            } finally {
                close();
            }
               //INSERT INTO friend_list(id, fid, userName, profile_pic, language) VALUES (10, 9, 'Lijiarong', 'Lijiarong_profile', 'Afrikanns');
               if(flag){
                    String enc_userName = encryption(userName,k);
                    String enc_lang = encryption(lang,k);  
                    String query2 = "INSERT INTO friend_list(id, fid, unread, userName, profile_pic, language) VALUES ( " +
                       id + "," + fid + ", " + 0 + ", '" + FuserName + "'" + ", '" + FProfile_pic + "'" + ", '" + FLang + "' )";
                    String query3 = "INSERT INTO friend_list(id, fid, unread, userName, profile_pic, language) VALUES ( " +
                       fid + "," + id + ", " + 0 + ", '" + enc_userName + "'" + ", '" + Profile + "'" + ", '" + enc_lang + "' )";
//                    System.out.println(query2);
                    executeUpdate(query2);
                    executeUpdate(query3);
               }

        }
        
        public void InsertChatHistory(String uid, String fid, String message){            
            Long Millis = Long.valueOf(System.currentTimeMillis());
            message = encryption(message, k);
            
            String query2 = "CREATE TABLE IF NOT EXISTS `chat_" + uid + fid + "`(" + 
                    "`id` BIGINT(20) UNSIGNED NOT NULL," + 
                    "`to_id` BIGINT(20) UNSIGNED NOT NULL," + 
                    "`message` TEXT(2000) , " + 
                    "`Millis` BIGINT(20)," +
                    "FOREIGN KEY (id) REFERENCES user(id)," +
                    "FOREIGN KEY (to_id) REFERENCES user(id)" + 
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8;"; 
            
            String query3 = "INSERT INTO chat_"+uid+fid+"(id, to_id, message,Millis) VALUES (" + uid + "," + fid + ", '" + message + "', " +
                     + Millis +  ")";
            
            
            
            executeUpdate(query2);

            executeUpdate(query3);
            
            
           // System.out.println(query1);
            
        }
        
        public void EditProfile(String id, String userName, String description, String location, String brith){
            String enc_userName = encryption(userName, k);
            String enc_loc = encryption(location, k);
            
            String query = "UPDATE user_profile SET userName='" + enc_userName + "' ," + "description='" 
                    + description + "' ," + "location='" + enc_loc + "' ," + "birth='" +
                    brith + "' " + "WHERE id=" + id;
            String query2 = "UPDATE user SET userName='" + enc_userName + "'" + "WHERE id=" + id;
//            System.out.println(query);
//            System.out.println(query2);
            executeUpdate(query);
            executeUpdate(query2);
        }
        
        public Profile_list getProfileInfo(String uid){
            Profile_list list = new Profile_list();
            String query = "select * from user_profile where id=" + uid;
            try{
               rs2 = executeQuery(query);
               while(rs.next()){
                   String dec_userName = decryption(rs.getString("userName"), k);
                   String dec_loc = decryption(rs.getString("location"), k);
                   
                   Profile_info info = new Profile_info();
                   info.setUserName(dec_userName);
                   info.setDescription(rs.getString("description"));
                   info.setLocation(dec_loc);
                   info.setBirth(rs.getString("birth"));
                   info.setID(rs.getInt("id"));
                   list.setList(info);
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
        
        public void InsertNotes(String writerID, String recieverID, String message){
            String query = "INSERT INTO notes (writter_id, recieve_id, description) VALUES (" +writerID + ", " + recieverID +
                    ", " + "'" + message + "'" + ")";
            executeUpdate(query);
        }
        
        public Notes_list getNotes(String id){
            Notes_list list = new Notes_list();
            String query = "select * from notes where recieve_id=" + id;
            try{
               rs = executeQuery(query);
               while(rs.next()){
                   Notes_info info = new Notes_info();
                   Integer writter_id = rs.getInt("writter_id");
                   String message = rs.getString("description");
                   String writter_name = getUserName(writter_id);
                   info.setSenderName(writter_name);
                   info.setSenderID(writter_id);
                   info.setMessage(message);
                   list.setList(info);
               }
            } catch(SQLException ex){
                
            } finally {
                close();
            }
            return list;
        }
        
        public String getUserName(Integer id){
            String userName = "";
            String query = "select * from user where id = " + id ;
            try{
               rs2 = executeQuery2(query);
               while(rs2.next()){
                   
                   userName = decryption(rs2.getString("userName"), k);
               }
            } catch(SQLException ex){
                
            } finally {
              
            }
            return userName;
        }
        
        public ChatHistory_List GetChatHistory(String uid, String fid){
            ChatHistory_List list = new ChatHistory_List();
            ChatHistory_List Sortlist = new ChatHistory_List();
            String query = "SELECT * from chat_"+uid+fid;
            String query2 = "SELECT * from chat_"+fid+uid;
            String test1 = "SHOW TABLES LIKE 'chat_"+ uid+fid + "'";
            String test2 = "SHOW TABLES LIKE 'chat_"+ fid+uid + "'";
            boolean exist1 = false;
            boolean exist2 = false;
//            String query = "select * from chat_history where id=" + uid + " AND to_id =" + fid;
//            String query2 = "select * from chat_history where id=" + fid + " AND to_id =" + uid;
            try{
               rs = executeQuery(test1);
               rs2 = executeQuery2(test2);
               if(rs.next()){
                   exist1 = true;
               }
               if(rs2.next()){
                   exist2 = true;
               }
            } catch(SQLException ex){
                
            } finally {
               close();
            }
            
            ArrayList<Long> time = new ArrayList<Long>();
            
            try{
               if(exist1){
                   rs = executeQuery(query);
                    while(rs.next()){
                        time.add(rs.getLong("Millis"));
                    }
               } 
               if(exist2){
                   rs2 = executeQuery2(query2);
                   while(rs2.next()){
                        time.add(rs2.getLong("Millis"));
                    }
               }

            } catch(SQLException ex){
                
            } finally {
               close();
            }
            
            Collections.sort(time);
            
            for(Long t : time){
                boolean flag = false;
                String query4 = "select * from chat_"+fid+uid+" where Millis=" + t;
                String query3 = "select * from chat_"+uid+fid+" where Millis=" + t;
                try{
                    if(exist1){
                        rs = executeQuery(query3);
                        if(rs.next()){
                            flag = true;
                            ChatHistoryInfo info = new ChatHistoryInfo();
                            info.setRecieverID(rs.getInt("to_id"));
                            info.setSenderID(rs.getInt("id"));
                            info.setTimestamp(rs.getLong("Millis"));
//                            System.out.println("here "+rs.getString("message"));
                            info.setMessage(decryption(rs.getString("message"), k));   
                            list.setList(info);
                        }
                    }
                    

                 } catch(SQLException ex){

                 } finally {
                    close();
                 }
                
                try{
                    if(!flag && exist2){
                        rs = executeQuery(query4);
                        if(rs.next()){
                            ChatHistoryInfo info = new ChatHistoryInfo();
                            info.setRecieverID(rs.getInt("to_id"));
                            info.setSenderID(rs.getInt("id"));
                            info.setTimestamp(rs.getLong("Millis"));
                            info.setMessage(decryption(rs.getString("message"), k));   
                            list.setList(info);
                        }
                    }
                 } catch(SQLException ex){

                 } finally {
                    close();
                 }
            }
            return list;
        }
}
