<%-- 
    Document   : Chat_Login
    Created on : 2019-4-5, 16:47:54
    Author     : xiangmacbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>WorldChat</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css"/>
        <!--<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css"/>-->
    </head>
    <body>
        <div class="login-form">

            <h1>World Chat</h1>
            <div id="google_translate_element" style="position:absolute; top:0px"></div>
            <script type="text/javascript">
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
            }
            </script>

            <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            <div class="login-top">
                <form action="LoginServlet" method="post">
                    <div class="login-ic">
                        <i></i>
                        <input type="text" name="email" id="email" value="Email" size="28"
                        class="validate-email required" required="required" autofocus=""
                        onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Enter Email';}"/>
                        <div class="clear"> </div>
                    </div>
                    <div class="login-ic">
                        <i class="icon"></i>
                        <input type="password" name=PWD id="password" value="Enter Password"
                      class="validate-password required" size="28" maxlength="99"
                      required="required" aria-required="true"
                      onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'User name';}"/>
                        <div class="clear"> </div>
                    </div>
                    <p style="color: white"><a href="regis.jsp">Create an Account</a></p>
                    <div class="log-bwn">
                        <input type="submit" value="Login" >
                    </div>
                    
                </form>
            </div>
        </div>
</body>
</html>
