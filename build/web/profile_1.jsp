<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>WorldChat</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <script src="js/profile.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <style>
                     body{
                    font-family: 'Montserrat', sans-serif;
                    font-size: 100%;
                    background: url(img/image3.jpg)no-repeat center fixed; 
                    background-size: cover;
                    -moz-background-size: cover;
                    -o-background-size: cover;
                  }
        </style>
        <script>
            function post(){
                var WritterID = '<%= session.getAttribute("id") %>';
                var recieverID = document.getElementById('fid').value
                var message = $(".message").html()
                
                xmlHttp = CreateXMLHttp(); 
                var url = "/WorldChat/UploadNotesServlet";
                xmlHttp.open("POST",url,true);
                xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlHttp.onreadystatechange=callback3s;    
                xmlHttp.send("WritterID="+ WritterID + "&recieverID="+recieverID+"&message=" +message);
                location.reload();
            }
            
            function CreateXMLHttp(){
                var xmlHttp;
                if(window.XMLHttpRequest){
                    xmlHttp = new XMLHttpRequest();
                }
                if(window.ActiveXObject){
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    if(!xmlHttp){
                        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                    } 
                }
                return xmlHttp;        
            }
            
            function callback3s(){
                if(xmlHttp.readyState == 4){
                    if(xmlHttp.status == 200){  
                    }
                }
            }
            
            function logout(){
                var uid = '<%= session.getAttribute("id") %>'
                xmlHttp = CreateXMLHttp(); 
                var url = "/WorldChat/LogOutServlet";
                xmlHttp.open("POST",url,true);
                xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlHttp.onreadystatechange=callback3s;    
                xmlHttp.send("uid="+ uid);
                sessionStorage.clear();
                window.location.replace("https://worldchat.azurewebsites.net/WorldChat/");
            }
            
            function setLanguage(){
                var ulang = '<%= session.getAttribute("language") %>';

                var logout = "log out";
                var find_new = "find new friends";
                var say = "say hello";
                var post = "post a message";
                var url = "https://translation.googleapis.com/language/translate/v2";
                var result;
                //Strings requiring translation
                url += "?q=" + find_new;
                url += "&q=" + logout;
                url += "&q=" + say;
                url += "&q=" + post;
                //Target language
                url += "&source=" + "EN";
                url += "&target=" + ulang;
                //Replace with your API key
                url += "&key=AIzaSyCJ8ctNy0HcnLccSI6eNaA85NpzUgULQvg";

                $.get(url, function (data, status) {

                    $('.find_new').text(data.data.translations[0].translatedText);
                    $('.logout').text(data.data.translations[1].translatedText);
                    $('.say').text(data.data.translations[2].translatedText);
                    $('.post').text(data.data.translations[3].translatedText);
            });
        }
        </script>
    </head>

    <body onload="setLanguage();">

        <!-- **************Nav bar, use for all pages***************    -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="Chat_Match.jsp">WorldChat</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                </ul>

                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                                    <a class="nav-link find_new" href="/WorldChat/MatchServlet">Find New Friends</a>
                    </li>
                    
                    <li class="nav-item navbar-right" >
                        <a class="nav-link logout" onclick="logout()" href="index.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container" style="max-width:1400px;margin-top:50px">
            <div class="row">
                <div class="col-3">
                    <div class="card">
                      <div class="container">
                        <c:forEach var="list" items="${requestScope.profile}">
                        <c:set var="userName" value="${list.getUserName()}" />
                        <c:set var="fid" value="${list.getID()}" />
                        <!--<h4 style="text-align: center">My Profile</h4>-->
                        <img src="img/antoine.jpg" class="rounded-circle mx-auto d-block"  style="height:200px;width:200px" alt="img/antoine.jpg">
                        <hr>
            
                        <h3><c:out value="${list.getUserName()}"></c:out></h3>
                        
                        <input id="fid" style="visibility: hidden" value="${fid}">
                        <p><c:out value="${list.getDescription()}"></c:out></p>
                        <hr>
                        <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i><c:out value="${list.getLocation()}"></c:out></p>
                        <hr>
                        <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><c:out value="${list.getBirth()}"></c:out></p>
                        </c:forEach>
                     </div>
                      </div>
                </div>
                
                <div class="w3-col m7">

                      <div class="w3-row-padding">
                        <div class="w3-col m12">
                          <div class="w3-card w3-round w3-white">
                            <div class="w3-container w3-padding">
                              <h6 class="w3-opacity say">Say Hello...</h6>
                              <p contenteditable="true" class="w3-border w3-padding message">Good luck on finals</p>
                              <button type="button" class="btn btn-outline-success my-2 my-sm-0 post" onclick="post()">Post</button> 
                            </div>
                          </div>
                        </div>
                      </div>
            <c:forEach var="list" items="${requestScope.notes}">  
            <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                <p><c:out value="${list.getMessage()}"></c:out></p>
                <span class="w3-right w3-opacity">1 min</span>
                <h4></h4><br>
                <hr class="w3-clear">
                <p></p>
                  <div class="w3-row-padding" style="margin:0 -16px">
                    <div class="w3-half">
                        <p><c:out value="${list.getSenderName()}"></c:out></p>
                    </div>
                     <div class="w3-half">
                    </div>  
    
                </div>
            </div>
            </c:forEach>
                </div>
            </div>
    </body>
    
</html>
