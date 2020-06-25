<%-- 
    Document   : Chat_Match
    Created on : 2019-3-18, 23:19:45
    Author     : Penghui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    body{
        font-family: 'Montserrat', sans-serif;
        font-size: 100%;
        background: url(img/image4.jpg)no-repeat center fixed; 
        background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
      }
    .header{
        padding-bottom: 30px;
    }
    .col-sm-4{
        border: 1px solid black;
    }
    .col-sm-12{
        border: 1px solid black;
    }
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
    }
    .scrollable {
    max-height: 485px;
    max-width: 300px;
    overflow-y: scroll;
    overflow-x: hidden;
    }   

</style>

<script type="text/javascript">  
function ValidatePetSelection()  
{  
    var checkboxes = document.getElementsByName("sex");  
    var numberOfCheckedItems = 0;  
    for(var i = 0; i < checkboxes.length; i++)  
    {  
        if(checkboxes[i].checked)  
            numberOfCheckedItems++;  
    }  
    if(numberOfCheckedItems > 1)  
    {  
        return false;  
    }  
}

function updateRange(val){
    document.getElementById('textInput').value= val; 
}

function updateRange2(val){
 
    document.getElementById('textInput2').value= val; 
}





</script>


<html>
    <head>
          <title>WorldChat</title>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
          <link rel="stylesheet" href="CSS/chat.css">
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
          <script src="js/Searchjs.js"></script>
          <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
          <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" type="text/css" href="font_Icon/iconfont.css">
          <link rel="stylesheet" href="CSS/body.css">

          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   </head>
   <body onload="setLanguage();">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="Chat_Match.jsp">WorldChat</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <div class="form-inline " id="mydiv">
                            <form action="SearchServlet" method="GET">
                                <input id="keyword" name="keywords" class="form-control mr-sm-2 search_input" list="json-datalist" type="text" size="50"  placeholder="Enter User Name" onkeyup="getMoreContents()" onblur="keywordBlur()" onfocus="getMoreContents()">
                                <button class="btn btn-outline-success my-2 my-sm-0 search" type="submit">Search</button>
                                <datalist id="json-datalist"></datalist>
                            </form>
                        </div>
                    </ul>

                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                            <li class="nav-item">
                                <form action="ProfileServlet" method="POST">
                                    <button class="btn btn-outline-success my-2 my-sm-0 profile" type="submit">Profile</button>
                                </form>
                            </li>
                            
                            <li class="nav-item navbar-right" >
                                <button class="btn btn-outline-success my-2 my-sm-0 logout" onclick="logout()">Logout</button>
                               
                            </li>
                    </ul>
              </div>
        </nav>
                <br> 
                <div class="row">  
<!--                    <form id = "match" action="PairServlet" method="post">-->
                        <div class="col-sm-5">
                            <form id = "match" action="MatchServlet" method="get">
                                <div class="form-group">
                                    <div class="container">
                                        <div class="card" style="width: 30rem;">
                                            <div class="card-header Country_lang">
                                                    Country and Language Perference
                                            </div>

                                            <div class="card-body">
                                            <select required name="language" class="custom-select mb-3" id="language">
                                                    <option value="">Choose your language</option>
                                                    <option value="AF">afrikaans</option>
                                                    <option value="SQ">Shqiptar</option>
                                                    <option value="AR">عربى</option>
                                                    <option value="HY">Hայերեն</option>
                                                    <option value="EU">Euskal</option>
                                                    <option value="BG">български</option>
                                                    <option value="CA">Català</option>
                                                    <option value="zh-CN">中文（普通话)</option>
                                                    <option value="HR">HRVATSKI</option>
                                                    <option value="CS">čeština</option>
                                                    <option value="DA">Dansk</option>
                                                    <option value="NL">Nederlands</option>
                                                    <option value="EN">English</option>
                                                    <option value="ET">Eesti keel</option>
                                                    <option value="FJ">Fiji</option>
                                                    <option value="FI">Suomalainen</option>
                                                    <option value="FR">Français</option>
                                                    <option value="KA">ქართული</option>
                                                    <option value="DE">Deutsche</option>
                                                    <option value="EL">Ελληνικά</option>
                                                    <option value="HE">עברית</option>
                                                    <option value="HI">हिंदी</option>
                                                    <option value="HU">Magyar</option>
                                                    <option value="IS">Íslensku</option>
                                                    <option value="ID">bahasa Indonesia</option>
                                                    <option value="GA">Gaeilge</option>
                                                    <option value="IT">italiano</option>
                                                    <option value="JA">日本语</option>
                                                    <option value="JW">Jawa</option>
                                                    <option value="KO">한국어</option>
                                                    <option value="LA">Latine</option>
                                                    <option value="LV">Latviešu valoda</option>
                                                    <option value="LT">Lietuvių</option>
                                                    <option value="MK">Македонски</option>
                                                    <option value="MS">Melayu</option>
                                                    <option value="MT">Malti</option>
                                                    <option value="MI">Maori</option>
                                                    <option value="MR">मराठी</option>
                                                    <option value="MN">Монгол хэл дээр</option>
                                                    <option value="NE">नेपाली</option>
                                                    <option value="NO">Norsk</option>
                                                    <option value="FA">فارسی</option>
                                                    <option value="PL">Polskie</option>
                                                    <option value="PT">Português</option>
                                                    <option value="RO">Română</option>
                                                    <option value="RU">русский</option>
                                                    <option value="SM">Samoa</option>
                                                    <option value="SR">Српски</option>
                                                    <option value="SK">Slovenský</option>
                                                    <option value="SL">Slovenščina</option>
                                                    <option value="ES">Español</option>
                                                    <option value="SW">Kiswahili</option>
                                                    <option value="SV">svenska </option>
                                                    <option value="TH">ไทย</option>
                                                    <option value="TR">Türk</option>
                                                    <option value="UK">Українська</option>
                                                    <option value="UR">اردو</option>
                                                    <option value="UZ">O'zbek</option>
                                                    <option value="VI">Tiếng Việt</option>
                                                    <option value="CY">Cymraeg</option>
                                                    <option value="XH">isiXhosa</option>
                                                </select>

                                                <select required name="country" class="custom-select mb-3" id="country">
                                                    <option value="">Choose your Country</option>
                                                        <option value="AF">افغانستان</option>
                                                        <option value="AX">Åland</option>
                                                        <option value="AL">Shqipëri</option>
                                                        <option value="DZ">الجزائر</option>
                                                        <option value="AS">Amerika Samoa</option>
                                                        <option value="AD">Andorra</option>
                                                        <option value="AO">Angola</option>
                                                        <option value="AI">Anguilla</option>
                                                        <option value="AQ">Антарктида</option>
                                                        <option value="AG">Antigua and Barbuda</option>
                                                        <option value="AR">Argentina</option>
                                                        <option value="AM">Հայաստան</option>
                                                        <option value="AW">Aruba</option>
                                                        <option value="AU">Australia</option>
                                                        <option value="AT">Österreich</option>
                                                        <option value="AZ">Azərbaycan</option>
                                                        <option value="BS">Bahamas</option>
                                                        <option value="BH">البحرين</option>
                                                        <option value="BB">Barbados</option>
                                                        <option value="BY">Беларусь</option>
                                                        <option value="BE">Belgique</option>
                                                        <option value="BZ">Belize</option>
                                                        <option value="BJ">Bénin</option>
                                                        <option value="BM">Bermuda</option>
                                                        <option value="BA">Bosna i Hercegovina</option>
                                                        <option value="BW">Botswana</option>
                                                        <option value="BV">Bouvet Island</option>
                                                        <option value="BR">Brasil</option>
                                                        <option value="IO">British Indian Ocean Territory</option>
                                                        <option value="BN">Brunei Darussalam</option>
                                                        <option value="BG">България</option>
                                                        <option value="BF">Burkina Faso</option>
                                                        <option value="BI">Burundi</option>
                                                        <option value="CM">Cameroun</option>
                                                        <option value="CA">Canada</option>
                                                        <option value="CV">Cabo Verde</option>
                                                        <option value="KY">Cayman Islands</option>
                                                        <option value="CF">République centrafricaine</option>
                                                        <option value="TD">Tchad</option>
                                                        <option value="CL">Chile</option>
                                                        <option value="CN">中国</option>
                                                        <option value="CX">Christmas Island</option>
                                                        <option value="CC">Cocos (Keeling) Islands</option>
                                                        <option value="CO">Colombia</option>
                                                        <option value="KM">Les Comores</option>
                                                        <option value="CG">Congo</option>
                                                        <option value="CD">Congo, the Democratic Republic of the</option>
                                                        <option value="CK">Cook Islands</option>
                                                        <option value="CR">Costa Rica</option>
                                                        <option value="CI">Côte d'Ivoire</option>
                                                        <option value="HR">Hrvatska</option>
                                                        <option value="CU">Cuba</option>
                                                        <option value="CW">Curaçao</option>
                                                        <option value="CY">Κύπρος</option>
                                                        <option value="CZ">Česká republika</option>
                                                        <option value="DK">Denmark</option>
                                                        <option value="DJ">Djibouti</option>
                                                        <option value="DM">Dominica</option>
                                                        <option value="DO">Dominican Republic</option>
                                                        <option value="EC">Ecuador</option>
                                                        <option value="EG">مصر</option>
                                                        <option value="SV">El Salvador</option>
                                                        <option value="GQ">Guinea Ecuatorial</option>
                                                        <option value="ER">Eritrea</option>
                                                        <option value="EE">Eesti</option>
                                                        <option value="FK">Falkland Islands (Malvinas)</option>
                                                        <option value="FO">Færøerne</option>
                                                        <option value="FI">Suomi</option>
                                                        <option value="FR">France</option>
                                                        <option value="GF">French Guiana</option>
                                                        <option value="PF">French Polynesia</option>
                                                        <option value="TF">French Southern Territories</option>
                                                        <option value="GA">Gabon</option>
                                                        <option value="GM">Gambia</option>
                                                        <option value="GE">საქართველო</option>
                                                        <option value="DE">Deutschland</option>
                                                        <option value="GH">Ghana</option>
                                                        <option value="GI">Gibraltar</option>
                                                        <option value="GR">Ελλάδα</option>
                                                        <option value="GL">Grønland</option>
                                                        <option value="GD">Grenada</option>
                                                        <option value="GP">Guadeloupe</option>
                                                        <option value="GU">Guam</option>
                                                        <option value="GT">Guatemala</option>
                                                        <option value="GG">Guernsey</option>
                                                        <option value="GN">Guinée</option>
                                                        <option value="GW">Guiné-Bissau</option>
                                                        <option value="GY">Guyana</option>
                                                        <option value="HT">Haïti</option>
                                                        <option value="HN">Honduras</option>

                                                        <option value="HU">Magyarország</option>
                                                        <option value="IS">Ísland</option>
                                                        <option value="IN">इंडिया</option>
                                                        <option value="ID">Indonesia</option>
                                                        <option value="IR">ایران (جمهوری اسلامی</option>
                                                        <option value="IQ">العراق</option>
                                                        <option value="IE">Éireann</option>
                                                        <option value="IM">Isle of Man</option>
                                                        <option value="IL">ישראל</option>
                                                        <option value="IT">Italia</option>
                                                        <option value="JM">Jamaica</option>
                                                        <option value="JP">日本</option>
                                                        <option value="JE">Jersey</option>
                                                        <option value="JO">الأردن</option>
                                                        <option value="KZ">Қазақстан</option>
                                                        <option value="KE">Kenya</option>
                                                        <option value="KI">Kiribati</option>
                                                        <option value="KP">대한민국</option>

                                                        <option value="KW">الكويت</option>
                                                        <option value="KG">Кыргызстан</option>
                                                        <option value="LV">Latvija</option>
                                                        <option value="LB">لبنان</option>
                                                        <option value="LS">Lesotho</option>
                                                        <option value="LR">Liberia</option>
                                                        <option value="LY">ليبيا</option>
                                                        <option value="LI">Liechtenstein</option>
                                                        <option value="LT">Lietuva</option>
                                                        <option value="LU">Luxembourg</option>

                                                        <option value="MK">Maqedonia, ish Republika Jugosllave e Maqedonisë</option>
                                                        <option value="MG">Madagascar</option>
                                                        <option value="MW">Malawi</option>
                                                        <option value="MY">Malaysia</option>
                                                        <option value="ML">Mali</option>
                                                        <option value="MT">Malta</option>
                                                        <option value="MH">Marshall Islands</option>
                                                        <option value="MQ">Martinique</option>
                                                        <option value="MR">موريتانيا</option>
                                                        <option value="MU">Mauritius</option>
                                                        <option value="YT">Mayotte</option>
                                                        <option value="MX">Mexico</option>
                                                        <option value="FM">Micronesia, Federated States of</option>
                                                        <option value="MD">Republica Moldova</option>
                                                        <option value="MC">Monaco</option>
                                                        <option value="MN">Монгол улс</option>
                                                        <option value="ME">Crna Gora</option>
                                                        <option value="MS">Montserrat</option>
                                                        <option value="MA">المغرب</option>
                                                        <option value="MZ">Moçambique</option>
                                                        <option value="NA">Namibia</option>
                                                        <option value="NR">Nauru</option>
                                                        <option value="NP">नेपाल</option>
                                                        <option value="NL">Netherlands</option>
                                                        <option value="NC">Nouvelle Calédonie</option>
                                                        <option value="NZ">New Zealand</option>
                                                        <option value="NI">Nicaragua</option>
                                                        <option value="NE">Niger</option>
                                                        <option value="NG">Nigeria</option>
                                                        <option value="NU">Niue</option>
                                                        <option value="NF">Norfolk Island</option>
                                                        <option value="MP">Northern Mariana Islands</option>
                                                        <option value="NO">Norge</option>
                                                        <option value="OM">سلطنة عمان</option>
                                                        <option value="PW">Palau</option>
                                                        <option value="PS">الأراضي الفلسطينية المحتلة</option>
                                                        <option value="PA">Panamá</option>
                                                        <option value="PG">Papua New Guinea</option>
                                                        <option value="PY">Paraguay</option>
                                                        <option value="PH">Pilipinas</option>
                                                        <option value="PN">Pitcairn</option>
                                                        <option value="PL">Polska</option>
                                                        <option value="PT">Portugal</option>
                                                        <option value="PR">Puerto Rico</option>
                                                        <option value="QA">دولة قطر</option>
                                                        <option value="RE">Réunion</option>
                                                        <option value="RO">România</option>
                                                        <option value="RU">RРоссийская Федерация</option>
                                                        <option value="RW">Rwanda</option>
                                                        <option value="BL">Saint Barthélemy</option>
                                                        <option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
                                                        <option value="KN">Saint Kitts and Nevis</option>
                                                        <option value="LC">Saint Lucia</option>
                                                        <option value="MF">Saint Martin (French part)</option>
                                                        <option value="PM">Saint Pierre and Miquelon</option>
                                                        <option value="VC">Saint Vincent and the Grenadines</option>
                                                        <option value="WS">Samoa</option>
                                                        <option value="SM">San Marino</option>
                                                        <option value="ST">São Tomé e Príncipe</option>
                                                        <option value="SA">المملكة العربية السعودية</option>
                                                        <option value="SN">Sénégal</option>
                                                        <option value="RS">Србија</option>
                                                        <option value="SC">les Seychelles</option>
                                                        <option value="SL">Sierra Leone</option>
                                                        <option value="SG">Singapore</option>
                                                        <option value="SX">Sint Maarten (hollandsk del)</option>
                                                        <option value="SK">Slovensko</option>
                                                        <option value="SI">Slovenija</option>
                                                        <option value="SB">Solomon Islands</option>
                                                        <option value="SO">Soomaaliya</option>
                                                        <option value="ZA">South Africa</option>
                                                        <option value="GS">სამხრეთ საქართველო და სამხრეთ სენდვიჩის კუნძულები</option>
                                                        <option value="SS">South Sudan</option>
                                                        <option value="ES">España</option>
                                                        <option value="LK">Sri Lanka</option>
                                                        <option value="SD">Sudan</option>
                                                        <option value="SR">Suriname</option>
                                                        <option value="SJ">Valbard og Jan Mayen</option>
                                                        <option value="SZ">Swaziland</option>
                                                        <option value="SE">Sverige</option>
                                                        <option value="CH">Suisse</option>
                                                        <option value="SY">الجمهورية العربية السورية</option>

                                                        <option value="TJ">Тоҷикистон</option>
                                                        <option value="TZ">Tanzania, Jamhuri ya Muungano wa</option>
                                                        <option value="TH">ประเทศไทย</option>
                                                        <option value="TL">Timor-Leste</option>
                                                        <option value="TG">Aller</option>
                                                        <option value="TK">Tokelau</option>
                                                        <option value="TT">Trinidad and Tobago</option>
                                                        <option value="TN">تونس</option>
                                                        <option value="TR">Türkiye</option>
                                                        <option value="TM">Туркменистан</option>
                                                        <option value="TC">Turks and Caicos Islands</option>
                                                        <option value="TV">Tuvalu</option>
                                                        <option value="UG">Uganda</option>
                                                        <option value="UA">Україна</option>
                                                        <option value="AE">الإمارات العربية المتحدة</option>
                                                        <option value="GB">United Kingdom</option>
                                                        <option value="US">United States</option>
                                                        <option value="UM">United States Minor Outlying Islands</option>
                                                        <option value="UY">Uruguay</option>
                                                        <option value="UZ">O'zbekiston</option>
                                                        <option value="VU">Vanuatu</option>
                                                        <option value="VE">Venezuela, Bolivarian Republic of</option>
                                                        <option value="VN">Việt Nam</option>
                                                        <option value="VG">Virgin Islands, British</option>
                                                        <option value="VI">Virgin Islands, U.S.</option>
                                                        <option value="WF">Wallis et Futuna</option>
                                                        <option value="EH">الصحراء الغربية</option>
                                                        <option value="YE">اليمن</option>
                                                        <option value="ZM">Zambia</option>
                                                        <option value="ZW">Zimbabwe</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="container">
                                        <div class="card" style="width: 30rem;">
                                            <div class="card-header gender">
                                                    Gender
                                            </div>
                                            <div class="card-body">
                                                    <input type="checkbox" name="sex" value="1" onclick="return ValidatePetSelection();"> &#9794;<br>  
                                                    <input type="checkbox" name="sex" value="0" onclick="return ValidatePetSelection();"> &#9792;<br>
                                                    
                                                    
                                                    <label for="customRange3" class="age_range">Age Range(18 - 80)</label>
                                                    <input type="range" class="custom-range" min="18" max="80" onchange="updateRange(this.value);">
                                                    <input type="range" class="custom-range" min="18" max="80" onchange="updateRange2(this.value);">
                                                    <input type="text" id="textInput" value="" name="min"> --
                                                    <input type="text" id="textInput2" value="" name="max">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="container">
                                        <div class="card" style="width: 30rem;">
                                            <div class="card-body">
                                                    <div class="form-group">
                                                            
                                                        <button type="submit" class="btn btn-primary login submit" onclick="show()">Submit</button>
                                                               
                                                        <button type="reset" class="btn btn-primary reset">Reset</button>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>  
                        </div>


                        <div class="col-sm-3 ">
                           
                            <div id="result" class="w3-container w3-card w3-white w3-round w3-margin"><br>
                                 
                                 <div class="scrollable">
                                     <c:forEach var="list" items="${requestScope.match_results}">
                                            <div class="match-form-group">
                                                
                                                        
                                                <c:set var="fid" value="${list.getFID()}" />   
                                                <c:set var="pic_path" value="${list.getProfilePic()}" />
                                               
                                                <form action="ProfileServlet" method="POST">
                                                    <div class="chat-list-match ">
                                                    
                                                   <div calss="pagination-centered"  style="margin-left: 40%; margin-right: 40%"><img src="img/icon01.png" alt="img/icon01.png"/></div>
                                                    
                                                   <div class="chat-name text-center" >
                                                       <p class="fname"><c:out value="${list.getUserName()}"></c:out></p>
                                                       
                                                       <p class="fid" style="visibility:hidden"><c:out value="${list.getFID()}"></c:out></p> 
                                                       <p class="flang" style="visibility:hidden"><c:out value="${list.getLanguage()}"></c:out></p>
                                                   </div>
                 
                                                </div>
                                                 <button class="profile_buttons enter_profile text-center" style="
                                                        margin-left: 41%; margin-right: 41%;
                                                        margin-top: 0%; margin-top: 0%;
                                                        background:none!important; 
                                                        color:DodgerBlue;
                                                        border:none;
                                                        font: inherit;
                                                        " value="${fid}" type="submit">
                                                        <i class="fa fa-home"></i>
                                                 </button>
                                                    <input name="id" value="${fid}" style="visibility:hidden">
                                                </form>    
                                                <hr>
                                                
                                            </div>
                                        </c:forEach>        
                                         </div>
                            </div>                    
                        </div>
                </div>
              
                <div class="chatContainer">
                        <div class="chatBtn">
                            <i class="iconfont icon-xiaoxi1"></i>
                        </div>
                  
                        <div class="chatBox" ref="chatBox">                        
                            <div class="chatBox-head">
                                <div class="chatBox-head-one conversations">
                                    Conversations
<!--                                <div class="chat-close close" style="margin: 10px 10px 0 0;font-size: 14px">Close</div>-->
                                </div>
                                <div class="chatBox-head-two">
                                    <div class="chat-return back">Back</div>
                                    <div class="chat-people">
                                        <div class="ChatInfoHead">
                                            <img src="img/icon01.png" alt="img/icon01.png"/>
                                        </div>
                                        <div class="ChatInfoName">User Name</div>
                                    </div>
                                    <div class="chat-close">Close</div>
                                </div>
                            </div>
                            <div class="chatBox-info">
                                <div class="chatBox-list" ref="chatBoxlist" >
                                     
                                     <c:forEach var="list" items="${requestScope.friend_list}">
                                     <c:set var="fid" value="${list.getFID()}" />
                                     <c:set var="status" value="${list.getStatus()}" />
                                     <c:set var="pic_path" value="${list.getProfilePic()}" />
                                    <div class="chat-list-people">
                                        <div><img src="img/icon01.png" alt="img/icon01.png"/></div>
                                        <div class="chat-name">
                                            <c:choose>
                                                <c:when test="${status.equals('1')}">
          
                                                    <p style="color:green"><c:out value="${list.getUserName()}"></c:out></p>
                                                    
                                                </c:when>    
                                                <c:otherwise>
                                                    <p><c:out value="${list.getUserName()}"></c:out></p>
                                                </c:otherwise>
                                             </c:choose>
                                            <p class="fid1" style="visibility:hidden"><c:out value="${list.getFID()}"></c:out></p>
                                            <p class="flang1" style="visibility:hidden"><c:out value="${list.getLanguage()}"></c:out></p>
                                        </div>
                                        <div class="message-num"><c:out value="${list.getUnread()}"></c:out></div>
                                    </div>
                                    <div class="delete_friends">
                                        
                                        <button class="delete_buttons" style="margin-left: 90%; 
                                                margin-right: 20%;
                                                background:none!important; 
                                                color:DodgerBlue;
                                                border:none; 
                                                padding:0!important;
                                                font: inherit;
                                                " value="${fid}">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </div>
                                            
                                    <hr>
                                    </c:forEach>   
                                </div>
                                <div class="chatBox-kuang" ref="chatBoxkuang">
                                    <div class="chatBox-content">
                                        <div class="chatBox-content-demo" id="chatBox-content-demo">

<!--                                            <div class="clearfloat">
                                                <div class="author-name">
                                                    <small class="chat-date">2017-12-02 14:26:58</small>
                                                </div>
                                                <div class="left">
                                                    <div class="chat-avatars"><img src="img/icon01.png" alt="头像"/></div>
                                                    <div class="chat-message">
                                                        给你看张图
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="clearfloat">
                                                <div class="author-name">
                                                    <small class="chat-date">2017-12-02 14:26:58</small>
                                                </div>
                                                <div class="left">
                                                    <div class="chat-avatars"><img src="img/icon01.png" alt="头像"/></div>
                                                    <div class="chat-message">
                                                        <img src="img/1.png" alt="">
                                                    </div>
                                                </div>
                                            </div>-->

<!--                                            <div class="clearfloat">
                                                <div class="author-name">
                                                    <small class="chat-date">2017-12-02 14:26:58</small>
                                                </div>
                                                <div class="right">
                                                    <div class="chat-message">嗯，适合做壁纸</div>
                                                    <div class="chat-avatars"><img src="img/icon02.png" alt="头像"/></div>
                                                </div>
                                            </div>-->

                                        </div>
                                    </div>
                                    <div class="chatBox-send">
                                        <div class="div-textarea" contenteditable="true"></div>
                                        <div>
                                            <button id="chat-biaoqing" class="btn-default-styles">
                                                <i class="iconfont icon-biaoqing"></i>
                                            </button>
                                            <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                                                <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                                       name="file" id="inputImage" class="hidden">
                                                <i class="iconfont icon-tuxiang"></i>
                                            </label>
                                            <button id="chat-fasong" class="btn-default-styles"><i class="iconfont icon-fasong"></i>
                                            </button>
                                        </div>
                                        <div class="biaoqing-photo">
                                            <ul>
                                                <li><span class="emoji-picker-image" style="background-position: -9px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -40px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -71px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -102px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -133px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -164px -18px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -9px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -40px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -71px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -102px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -133px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -164px -52px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -9px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -40px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -71px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -102px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -133px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -164px -86px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -9px -120px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -40px -120px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -71px -120px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -102px -120px;"></span>
                                                </li>
                                                <li><span class="emoji-picker-image" style="background-position: -133px -120px;"></span>
                                                </li>
                                                <li><span class="emoji-picker-image" style="background-position: -164px -120px;"></span>
                                                </li>
                                                <li><span class="emoji-picker-image" style="background-position: -9px -154px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -40px -154px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -71px -154px;"></span></li>
                                                <li><span class="emoji-picker-image" style="background-position: -102px -154px;"></span>
                                                </li>
                                                <li><span class="emoji-picker-image" style="background-position: -133px -154px;"></span>
                                                </li>
                                                <li><span class="emoji-picker-image" style="background-position: -164px -154px;"></span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        
<script
  src="https://code.jquery.com/jquery-1.10.2.js"
  integrity="sha256-it5nQKHTz+34HijZJQkpNBIHsjpV8b6QzMJs9tmOBSo="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn-virginia.goeasy.io/goeasy.js"></script>
<script>

    var FID;
    var flang;
    screenFuc();
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
        var search = $('.search').text();
        var search_holder = "Enter User name";
        var profile = "Personal Page";
        var logout = $('.logout').text();
        
        var country_language = "country and language perference";
        var gender = "gender";
        var age = "age range";
        var submit = "submit";
        var reset = "reset";
        var conversation = "conversation";
        var close = "close page";
        var back = "previous page";
        var deletes = "delete";
        
        var url = "https://translation.googleapis.com/language/translate/v2";
        var result;
        //Strings requiring translation
        url += "?q=" + search;
        url += "&q=" + profile;
        url += "&q=" + logout;
        url += "&q=" + country_language;
        url += "&q=" + gender;
        url += "&q=" + age;
        url += "&q=" + submit;
        url += "&q=" + reset;
        url += "&q=" + conversation;
        url += "&q=" + close;
        url += "&q=" + back;
        url += "&q=" + search_holder;
        //Target language
        url += "&source=" + "EN";
        url += "&target=" + ulang;
        //Replace with your API key
        url += "&key=AIzaSyCJ8ctNy0HcnLccSI6eNaA85NpzUgULQvg";

        $.get(url, function (data, status) {
            $('.search').text(data.data.translations[0].translatedText);
            
            $('.profile').text(data.data.translations[1].translatedText);
            $('.logout').text(data.data.translations[2].translatedText);
            $('.Country_lang').text(data.data.translations[3].translatedText);
            $('.gender').text(data.data.translations[4].translatedText);
            $('.age_range').text(data.data.translations[5].translatedText);
            $('.submit').text(data.data.translations[6].translatedText);
            $('.reset').text(data.data.translations[7].translatedText);
            $('.conversations').text(data.data.translations[8].translatedText);
//            $('.close').text(data.data.translations[9].translatedText);
            $('.chat-close').text(data.data.translations[9].translatedText);
            $('.back').text(data.data.translations[10].translatedText);
            $('.search_input').attr('placeholder', data.data.translations[11].translatedText) ;
            
        });
        
}

    
    function screenFuc() {
        var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
        //屏幕小于768px时候,布局change
        var winWidth = $(window).innerWidth();
        if (winWidth <= 768) {
            var totalHeight = $(window).height(); //页面整体高度
            $(".chatBox-info").css("height", totalHeight - topHeight);
            var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
            //中间内容高度
            $(".chatBox-content").css("height", infoHeight - 46);
            $(".chatBox-content-demo").css("height", infoHeight - 46);

            $(".chatBox-list").css("height", totalHeight - topHeight);
            $(".chatBox-kuang").css("height", totalHeight - topHeight);
            $(".div-textarea").css("width", winWidth - 106);
        } else {
            $(".chatBox-info").css("height", 495);
            $(".chatBox-content").css("height", 448);
            $(".chatBox-content-demo").css("height", 448);
            $(".chatBox-list").css("height", 495);
            $(".chatBox-kuang").css("height", 495);
            $(".div-textarea").css("width", 260);
        }
    }
    (window.onresize = function () {
        screenFuc();
    })();
    //未读信息数量为空时

    //打开/关闭聊天框
    $(".chatBtn").click(function () {
        $(".chatBox").toggle(10);
    })
    $(".chat-close").click(function () {
        $(".chatBox").toggle(10);
    })
    
    //进聊天页面
    $(".chat-list-people").each(function () {
        $(this).click(function () {
            var n = $(this).index();
            $(".chatBox-head-one").toggle();
            $(".chatBox-head-two").toggle();
            $(".chatBox-list").fadeToggle();
            $(".chatBox-kuang").fadeToggle();
            $(".message-num").text("0");
            //传名字
            $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

            //传头像
            $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
            
            
            var uid = '<%= session.getAttribute("id") %>' 
            var fid = $(this).children(".chat-name").children("p.fid1").eq(0).html()
            flang = $(this).children(".chat-name").children("p.flang1").eq(0).html()
            FID = fid;

            var goEasy = new GoEasy({
            appkey: 'BC-fd07aa06501242ecaa06c4d2c3a58556'
            });
            
            var large = uid;
            var small = FID;
            if(large < small){
                large = FID;
                small = uid;
            }
            var channel = new Array();
            channel.push(large);
            channel.push(small);
            var c = channel.join("");
            
            //Load Chat history
            xmlHttp = CreateXMLHttp(); 
            var url = "/WorldChat/LoadChatHistoryServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttp.onreadystatechange=callback4s;    
            xmlHttp.send("uid="+ uid + "&fid="+ fid);
            
            //recieve message
            goEasy.subscribe({
                channel:c,
                onMessage: function(message){
                    var recieve = message.content;
                    var array = recieve.split("::");
                    var array2 = array[0].split("--");
//                    console.log(uid)
//                    console.log(array[0])
                                    
                    if(uid === array2[1]){
                            var d = new Date();
                            var date = d.toLocaleString();  
                          $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                            "<div class=\"author-name\"><small class=\"chat-date\">"+date+"</small> </div> " +
                            "<div class=\"left\">" + "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div>" +
                            "<div class=\"chat-message\">" + array[1] + "</div></div></div>");
          
                            $(document).ready(function () {
                                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                            });
                        
                    } else {
                        console.log("other")
                    }  
                }
            });
        })
    });
        
    $(".chat-list-match").each(function () {
        $(this).click(function () {            
            var uid = '<%= session.getAttribute("id") %>' 
            var fid = $(this).children(".chat-name").children("p.fid").eq(0).html()
            var fname = $(this).children(".chat-name").children("p.fname").eq(0).html()
            var flang = $(this).children(".chat-name").children("p.flang").eq(0).html()
            var ulang = '<%= session.getAttribute("language") %>'
            
            
            xmlHttp = CreateXMLHttp(); 
            var url = "/WorldChat/MatchServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttp.onreadystatechange=callback2s;    
            xmlHttp.send("fid="+ fid);

           $(this).html("");
                
        })
    });
    
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

    function callback2s(){
        if(xmlHttp.readyState === 4){
            if(xmlHttp.status === 200){
                var result = xmlHttp.responseText
                var json = JSON.parse(result);
                setContents(json)  
            }
        }
    }
    function callback3s(){
        
        if(xmlHttp.readyState === 4){
            if(xmlHttp.status === 200){  
               
            }
        }
    }
    
    function callback4s(){
        if(xmlHttp.readyState === 4){
            if(xmlHttp.status === 200){
                var result = xmlHttp.responseText
                var json = JSON.parse(result);
                setChatHistory(json)
            }
        }
    }
    
    function setChatHistory(contents){
        var uid = '<%= session.getAttribute("id") %>' 
        var length = Object.keys(contents).length;
        var i = 0;
        
        while(i < length){
            var message = contents[i].message;
            console.log(contents[i])
            var time = contents[i].timestamp;
            console.log(time)
            var sender = contents[i].senderID.toString();
            var d = new Date(time);
            var date = d.toLocaleString();
            if(sender === uid){
                 $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+ date +"</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"> " + message + " </div> " +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            } else {
                 $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+date+"</small> </div> " +
                    "<div class=\"left\">" + "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div>" +
                    "<div class=\"chat-message\">" + message + "</div></div></div>");
            }
            i++;
        }
        $(document).ready(function () {
            $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
       });
            
    }
    

    function setContents(contents){
        var key, count = 0;
        
        var i = 0;
        var length = Object.keys(contents).length;
           
        while(i < length){
            var fname = contents[i].userName.toString()
            var flang = contents[i].language.toString()
            var fid = contents[i].FID.toString()
            console.log()
            
            $(".chatBox-list").append("<div class=\"chat-list-people\">" +
                "<div><img src=\"img/icon01.png\" alt=\"img/icon01.png\"/></div> " +
                "<div class=\"chat-name\"><p> " + fname + "</p><p class=\"fid1\" style=\"visibility:hidden\">" + fid + 
                "</p> <p class=\"flang1\" style=\"visibility:hidden\">"+ flang +"</p></div></div>" +"<hr>");
            i++;
        }
        
       location.reload();
    }

    $(".delete_buttons").click(function() {
        var fid = $(this).val();
        xmlHttp = CreateXMLHttp(); 
            var url = "/WorldChat/DeleteServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttp.onreadystatechange=callback2s;    
            xmlHttp.send("fid="+ fid);
            location.reload();
    });
    
    $(".profile_buttons").click(function() {
        var uid = $(this).val();
        xmlHttp = CreateXMLHttp(); 
            var url = "/WorldChat/ProfileServlet";
            xmlHttp.open("POST",url,true);
            xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlHttp.onreadystatechange=callback3s;    
            xmlHttp.send("id="+ uid);
    });
    

    
    //返回列表
    $(".chat-return").click(function () {
        $(".chatBox-head-one").toggle(1);
        $(".chatBox-head-two").toggle(1);
        $(".chatBox-list").fadeToggle(1);
        $(".chatBox-kuang").fadeToggle(1);
        $(".chatBox-content-demo").html("");
        
    });

    //Send Message
    $("#chat-fasong").click(function () {
        var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
        
        var d = new Date();
        var date = d.toLocaleString();
        if (textContent != "") {
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+ date +"</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\">" + textContent + "</div>" +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //Clear textarea after send 
            $(".div-textarea").html("");
            //chat box default at b
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
            
            var uid = '<%= session.getAttribute("id") %>' 
            var fid = $(".chat-list-people").children(".chat-name").children("p.fid1").eq(0).html()
           
            var ulang = '<%= session.getAttribute("language") %>'
            
            var large = uid;
            var small = FID;
            if(large < small){
                large = FID;
                small = uid;
            }
            var channel = new Array();
            channel.push(large);
            channel.push(small);
            var mess;
            
            if(ulang !== flang){
                var url = "https://translation.googleapis.com/language/translate/v2";
                var result;
                //Strings requiring translation
                url += "?q=" + textContent;
                //Target language
                url += "&source=" + ulang;
                url += "&target=" + flang;
                //Replace with your API key
                url += "&key=AIzaSyCJ8ctNy0HcnLccSI6eNaA85NpzUgULQvg";
                
                $.get(url, function (data, status) {
                    var uid = '<%= session.getAttribute("id") %>' 
                    var large = uid;
                    var small = FID;
                    if(large < small){
                        large = FID;
                        small = uid;
                    }
                    var channel = new Array();
                    channel.push(large);
                    channel.push(small);
                    result = data.data.translations[0].translatedText;
                    
                    var mess = uid+ "--" +FID + "::" + textContent + "(" + result + ")";
                     
                    xmlHttp = CreateXMLHttp(); 
                    var url = "/WorldChat/ChatHistoryServlet";
                    xmlHttp.open("POST",url,true);
                    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                    xmlHttp.onreadystatechange=callback3s;    
                    xmlHttp.send("message="+ mess);            
                    var c = channel.join("");

                    var goEasy = new GoEasy({
                            appkey: "BC-fd07aa06501242ecaa06c4d2c3a58556"
                    });
                    goEasy.publish({
                        channel: c,
                        message: mess
                    });
                });
                
            } else {
                mess = uid+ "--" +FID + "::" + textContent;
                xmlHttp = CreateXMLHttp(); 
                var url = "/WorldChat/ChatHistoryServlet";
                xmlHttp.open("POST",url,true);
                xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlHttp.onreadystatechange=callback3s;    
                xmlHttp.send("message="+ mess);            
                var c = channel.join("");

                var goEasy = new GoEasy({
                        appkey: "BC-fd07aa06501242ecaa06c4d2c3a58556"
                });

                goEasy.publish({
                    channel: c,
                    message: mess
                });
            }
        }
    });

    //      Send emoj
    $("#chat-biaoqing").click(function () {
        $(".biaoqing-photo").toggle();
    });
    $(document).click(function () {
        $(".biaoqing-photo").css("display", "none");
    });
    $("#chat-biaoqing").click(function (event) {
        event.stopPropagation();
    });

    $(".emoji-picker-image").each(function () {
        $(this).click(function () {
            var bq = $(this).parent().html();
            console.log(bq)
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"> " + bq + " </div> " +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            //发送后关闭表情框
            $(".biaoqing-photo").toggle();
            //聊天框默认最底部
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        })
    });

    //Send Pictures
    function selectImg(pic) {
        if (!pic.files || !pic.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var images = evt.target.result;
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">2017-12-02 14:26:58</small> </div> " +
                "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                "<div class=\"chat-avatars\"><img src=\"img/icon01.png\" alt=\"头像\" /></div> </div> </div>");
            
            $(document).ready(function () {
                $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
            });
        };
        reader.readAsDataURL(pic.files[0]);
    }
    
    function translate(source, target, text){
        var url = "https://translation.googleapis.com/language/translate/v2";
        var result;
            //Strings requiring translation
            url += "?q=" + text;
            //Target language
            url += "&source=" + source;
            url += "&target=" + target;
            //Replace with your API key
            url += "&key=AIzaSyCJ8ctNy0HcnLccSI6eNaA85NpzUgULQvg";
            $.get(url, function (data, status) {
                 result = data.data.translations[0].translatedText;
                 console.log(result)
                //Results are returned in an array following the order they were passed. 
               
            });
            
            return result;
    }
    
    
</script>
                     
    </body>
</html>

