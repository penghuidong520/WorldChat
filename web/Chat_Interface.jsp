<%-- 
    Document   : Chat_Interface
    Created on : 2019-2-26, 15:05:04
    Author     : xiangmacbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>WorldChat</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="CSS/chatbox.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
  <script src="js/Searchjs.js"></script>
  <link rel="stylesheet" href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
       
<body>

 <!-- **************Nav bar, use for all pages***************    -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="Chat_Match.jsp">WorldChat</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <div class="form-inline " id="mydiv">
                            <form action="SearchServlet" method="POST">
                                <input id="keyword" name="keywords" class="form-control mr-sm-2" list="json-datalist" type="text" size="50"  placeholder="Search" onkeyup="getMoreContents()" onblur="keywordBlur()" onfocus="getMoreContents()">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                <datalist id="json-datalist"></datalist>
                            </form>
                        </div>
                    </ul>

                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                            <li class="nav-item">
                                    <a class="nav-link" href="Chat_Match.jsp">Find New Friends</a>
                            </li>
                            <li class="nav-item">
                                    <a class="nav-link" href="profile.jsp">Profile</a>
                            </li>
                            <li class="nav-item navbar-right" >
                                    <a class="nav-link" href="Chat_Login.jsp">Login/Logout</a>
                            </li>
                    </ul>
              </div>
    </nav>

    <div class="row h-50">
        <div class="col-sm-10">
            <div class="container">
            <div class="messaging">
                  <div class="inbox_msg">
                      <c:forEach var="list" items="${requestScope.user}">
                          <p><c:out value="${list.getUserName()}"></c:out></p>
                           <p><c:out value="${list.getProfilePic()}"></c:out></p>
                          <p><c:out value="${list.getLanguage()}"></c:out></p>
                      </c:forEach>
                          
                      <c:forEach var="list2" items="${requestScope.friend}">
                          <p><c:out value="${list2.getUserName()}"></c:out></p>
                          <p><c:out value="${list2.getProfilePic()}"></c:out></p>
                          <p><c:out value="${list2.getLanguage()}"></c:out></p>
                      </c:forEach>
                          
                      
<!--                    <div class="inbox_people">
                      <div class="headind_srch">
                        <div class="recent_heading">
                          <h4>Recent Chats</h4>
                        </div>
                      </div>
                      <div class="inbox_chat">
                        <div class="chat_list active_chat">
                            
                          
                          <div class="chat_people">
                           
                            <div class="chat_img"> <img src=Images/dota.jpg> </div>
                            <div class="chat_ib">
                              <h5><span class="chat_date">March 3</span></h5>
                              <p> TTTTTTTTESTTTTTTTT</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>     -->
<!--                    <div class="mesgs">
                      <div class="msg_history">
                        <div class="incoming_msg">
                          <div class="incoming_msg_img"> <img src=Images/dota.jpg> </div>
                          <div class="received_msg">
                            <div class="received_withd_msg">
                              <p>测试消息</p>
                              <p>Test Message</p>
                              <span class="time_date"> 10:00 AM    |    Feb 26</span></div>
                          </div>
                        </div>
                        <div class="outgoing_msg">
                          <div class="sent_msg">
                            <p>Recieved</p>
                            <span class="time_date"> 10:30 AM    |    Feb 26</span> </div>
                        </div>
                          
                      </div>
                        <div class="toolbar">
                            <i class='far fa-folder-open' style='font-size:20px'></i>
                            <i class='fas fa-images' style='font-size:20px'></i>
                        </div>
                      
                      <div class="type_msg">
                        <div class="input_msg_write">
                          <input type="text" class="write_msg" placeholder="Type a message" />
                          <button class="msg_send_btn" type="button">Send</button>
                        </div>
                      </div>
                    </div>-->
                  </div>
                </div>
            </div>
        </div>
        
        <div class="col-sm-2">
           <ul class="list-group">
            <li class="list-group-item ">Friends List</li>
            <li class="list-group-item online"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item online"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item online"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
            <li class="list-group-item offline"><img src="Images/dota.jpg" class="profile-pic rounded-circle"> John</li>
           </ul>
        </div>
    </div>
    
    
 
    
</body>
</html>
