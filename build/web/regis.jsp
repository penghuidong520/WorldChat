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
        <link href="CSS/style_1.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <script src="bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: black;
                
              }

              * {
                box-sizing: border-box;
              }

              /* Add padding to containers */
              .container {
                padding: 16px;
                background-color:transparent;
              }

              /* Full-width input fields */
              input[type=text], input[type=password] {
                width: 100%;
                height:70%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
                
              }

              input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
              }

              /* Overwrite default styles of hr */
              hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
              }

              /* Set a style for the submit button */
              .registerbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
              }

              .registerbtn:hover {
                opacity: 1;
              }

              /* Add a blue text color to links */
              a {
                color: dodgerblue;
              }

              /* Set a grey background color and center the text of the "sign in" section */
              .signin {
                background-color: transparent;
                text-align: center;
              }
        </style>
    </head>
    <body>
        <div id="google_translate_element" style="position:absolute; top:0px"></div>
            <script type="text/javascript">
            function googleTranslateElementInit() {
              new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
            }
            </script>

            <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            
        <div class="login-form">
            <form action="RegisServlet" method="POST">
            <div class="row">
                <div class="container header" style="margin-right: auto; margin-left: auto;">
                      <h1 style="font-weight: bold;">Create New Account</h1>
                </div>
                    <div class="col-sm-5">
                      <div class="form-group">
                        <div class="container" style="margin-right: auto; margin-left: auto;" >
                            <p style="color:white">Account Information</p>
                            <hr>
                            <p style="color:white">Email</p>
                            <input type="text" name="email" required="required">
                            <p style="color:white">User Name </p>
                            <input type="text" name="UserName" required="required">
                            <p style="color:white">Password</p>
                            <input type="password"  name="psw" required="required">
                             
                            <hr>
                        </div>
                      </div>
                   
                </div>
                <div class="col-sm-1">
                    
                </div>
                
                <div class="col-sm-6">
                    <div class="container" style="margin-right: auto; margin-left: auto" >
                         <p style="color:white">Profile Information</p>
                         <hr>
                         <div class="form-group">
                                                       <select required name="language" class="custom-select mb-3" id="language">
                            <option value="">Choose your language</option>
                            <option value="AF">afrikaans</option>
                            <option value="SQ">Shqiptar</option>
                            <option value="AR">????????</option>
                            <option value="HY">H????????????</option>
                            <option value="EU">Euskal</option>
                            <option value="BG">??????????????????</option>
                            <option value="CA">Catal??</option>
                            <option value="zh-CN">??????????????????)</option>
                            <option value="HR">HRVATSKI</option>
                            <option value="CS">??e??tina</option>
                            <option value="DA">Dansk</option>
                            <option value="NL">Nederlands</option>
                            <option value="EN">English</option>
                            <option value="ET">Eesti keel</option>
                            <option value="FJ">Fiji</option>
                            <option value="FI">Suomalainen</option>
                            <option value="FR">Fran??ais</option>
                            <option value="KA">?????????????????????</option>
                            <option value="DE">Deutsche</option>
                            <option value="EL">????????????????</option>
                            <option value="HE">??????????</option>
                            <option value="HI">???????????????</option>
                            <option value="HU">Magyar</option>
                            <option value="IS">??slensku</option>
                            <option value="ID">bahasa Indonesia</option>
                            <option value="GA">Gaeilge</option>
                            <option value="IT">italiano</option>
                            <option value="JA">?????????</option>
                            <option value="JW">Jawa</option>
                            <option value="KO">?????????</option>
                            <option value="LA">Latine</option>
                            <option value="LV">Latvie??u valoda</option>
                            <option value="LT">Lietuvi??</option>
                            <option value="MK">????????????????????</option>
                            <option value="MS">Melayu</option>
                            <option value="MT">Malti</option>
                            <option value="MI">Maori</option>
                            <option value="MR">???????????????</option>
                            <option value="MN">???????????? ?????? ????????</option>
                            <option value="NE">??????????????????</option>
                            <option value="NO">Norsk</option>
                            <option value="FA">??????????</option>
                            <option value="PL">Polskie</option>
                            <option value="PT">Portugu??s</option>
                            <option value="RO">Rom??n??</option>
                            <option value="RU">??????????????</option>
                            <option value="SM">Samoa</option>
                            <option value="SR">????????????</option>
                            <option value="SK">Slovensk??</option>
                            <option value="SL">Sloven????ina</option>
                            <option value="ES">Espa??ol</option>
                            <option value="SW">Kiswahili</option>
                            <option value="SV">svenska </option>
                            <option value="TH">?????????</option>
                            <option value="TR">T??rk</option>
                            <option value="UK">????????????????????</option>
                            <option value="UR">????????</option>
                            <option value="UZ">O'zbek</option>
                            <option value="VI">Ti???ng Vi???t</option>
                            <option value="CY">Cymraeg</option>
                            <option value="XH">isiXhosa</option>
                        </select>

                        <select required name="country" class="custom-select mb-3" id="country">
                            <option value="">Choose your Country</option>
                                <option value="AF">??????????????????</option>
                                <option value="AX">??land</option>
                                <option value="AL">Shqip??ri</option>
                                <option value="DZ">??????????????</option>
                                <option value="AS">Amerika Samoa</option>
                                <option value="AD">Andorra</option>
                                <option value="AO">Angola</option>
                                <option value="AI">Anguilla</option>
                                <option value="AQ">????????????????????</option>
                                <option value="AG">Antigua and Barbuda</option>
                                <option value="AR">Argentina</option>
                                <option value="AM">????????????????</option>
                                <option value="AW">Aruba</option>
                                <option value="AU">Australia</option>
                                <option value="AT">??sterreich</option>
                                <option value="AZ">Az??rbaycan</option>
                                <option value="BS">Bahamas</option>
                                <option value="BH">??????????????</option>
                                <option value="BB">Barbados</option>
                                <option value="BY">????????????????</option>
                                <option value="BE">Belgique</option>
                                <option value="BZ">Belize</option>
                                <option value="BJ">B??nin</option>
                                <option value="BM">Bermuda</option>
                                <option value="BA">Bosna i Hercegovina</option>
                                <option value="BW">Botswana</option>
                                <option value="BV">Bouvet Island</option>
                                <option value="BR">Brasil</option>
                                <option value="IO">British Indian Ocean Territory</option>
                                <option value="BN">Brunei Darussalam</option>
                                <option value="BG">????????????????</option>
                                <option value="BF">Burkina Faso</option>
                                <option value="BI">Burundi</option>
                                <option value="CM">Cameroun</option>
                                <option value="CA">Canada</option>
                                <option value="CV">Cabo Verde</option>
                                <option value="KY">Cayman Islands</option>
                                <option value="CF">R??publique centrafricaine</option>
                                <option value="TD">Tchad</option>
                                <option value="CL">Chile</option>
                                <option value="CN">??????</option>
                                <option value="CX">Christmas Island</option>
                                <option value="CC">Cocos (Keeling) Islands</option>
                                <option value="CO">Colombia</option>
                                <option value="KM">Les Comores</option>
                                <option value="CG">Congo</option>
                                <option value="CD">Congo, the Democratic Republic of the</option>
                                <option value="CK">Cook Islands</option>
                                <option value="CR">Costa Rica</option>
                                <option value="CI">C??te d'Ivoire</option>
                                <option value="HR">Hrvatska</option>
                                <option value="CU">Cuba</option>
                                <option value="CW">Cura??ao</option>
                                <option value="CY">????????????</option>
                                <option value="CZ">??esk?? republika</option>
                                <option value="DK">Denmark</option>
                                <option value="DJ">Djibouti</option>
                                <option value="DM">Dominica</option>
                                <option value="DO">Dominican Republic</option>
                                <option value="EC">Ecuador</option>
                                <option value="EG">??????</option>
                                <option value="SV">El Salvador</option>
                                <option value="GQ">Guinea Ecuatorial</option>
                                <option value="ER">Eritrea</option>
                                <option value="EE">Eesti</option>
                                <option value="FK">Falkland Islands (Malvinas)</option>
                                <option value="FO">F??r??erne</option>
                                <option value="FI">Suomi</option>
                                <option value="FR">France</option>
                                <option value="GF">French Guiana</option>
                                <option value="PF">French Polynesia</option>
                                <option value="TF">French Southern Territories</option>
                                <option value="GA">Gabon</option>
                                <option value="GM">Gambia</option>
                                <option value="GE">??????????????????????????????</option>
                                <option value="DE">Deutschland</option>
                                <option value="GH">Ghana</option>
                                <option value="GI">Gibraltar</option>
                                <option value="GR">????????????</option>
                                <option value="GL">Gr??nland</option>
                                <option value="GD">Grenada</option>
                                <option value="GP">Guadeloupe</option>
                                <option value="GU">Guam</option>
                                <option value="GT">Guatemala</option>
                                <option value="GG">Guernsey</option>
                                <option value="GN">Guin??e</option>
                                <option value="GW">Guin??-Bissau</option>
                                <option value="GY">Guyana</option>
                                <option value="HT">Ha??ti</option>
                                <option value="HN">Honduras</option>
                               
                                <option value="HU">Magyarorsz??g</option>
                                <option value="IS">??sland</option>
                                <option value="IN">??????????????????</option>
                                <option value="ID">Indonesia</option>
                                <option value="IR">?????????? (???????????? ????????????</option>
                                <option value="IQ">????????????</option>
                                <option value="IE">??ireann</option>
                                <option value="IM">Isle of Man</option>
                                <option value="IL">??????????</option>
                                <option value="IT">Italia</option>
                                <option value="JM">Jamaica</option>
                                <option value="JP">??????</option>
                                <option value="JE">Jersey</option>
                                <option value="JO">????????????</option>
                                <option value="KZ">??????????????????</option>
                                <option value="KE">Kenya</option>
                                <option value="KI">Kiribati</option>
                                <option value="KP">????????????</option>
                                
                                <option value="KW">????????????</option>
                                <option value="KG">????????????????????</option>
                                <option value="LV">Latvija</option>
                                <option value="LB">??????????</option>
                                <option value="LS">Lesotho</option>
                                <option value="LR">Liberia</option>
                                <option value="LY">??????????</option>
                                <option value="LI">Liechtenstein</option>
                                <option value="LT">Lietuva</option>
                                <option value="LU">Luxembourg</option>
                               
                                <option value="MK">Maqedonia, ish Republika Jugosllave e Maqedonis??</option>
                                <option value="MG">Madagascar</option>
                                <option value="MW">Malawi</option>
                                <option value="MY">Malaysia</option>
                                <option value="ML">Mali</option>
                                <option value="MT">Malta</option>
                                <option value="MH">Marshall Islands</option>
                                <option value="MQ">Martinique</option>
                                <option value="MR">??????????????????</option>
                                <option value="MU">Mauritius</option>
                                <option value="YT">Mayotte</option>
                                <option value="MX">Mexico</option>
                                <option value="FM">Micronesia, Federated States of</option>
                                <option value="MD">Republica Moldova</option>
                                <option value="MC">Monaco</option>
                                <option value="MN">???????????? ??????</option>
                                <option value="ME">Crna Gora</option>
                                <option value="MS">Montserrat</option>
                                <option value="MA">????????????</option>
                                <option value="MZ">Mo??ambique</option>
                                <option value="NA">Namibia</option>
                                <option value="NR">Nauru</option>
                                <option value="NP">???????????????</option>
                                <option value="NL">Netherlands</option>
                                <option value="NC">Nouvelle Cal??donie</option>
                                <option value="NZ">New Zealand</option>
                                <option value="NI">Nicaragua</option>
                                <option value="NE">Niger</option>
                                <option value="NG">Nigeria</option>
                                <option value="NU">Niue</option>
                                <option value="NF">Norfolk Island</option>
                                <option value="MP">Northern Mariana Islands</option>
                                <option value="NO">Norge</option>
                                <option value="OM">?????????? ????????</option>
                                <option value="PW">Palau</option>
                                <option value="PS">?????????????? ???????????????????? ??????????????</option>
                                <option value="PA">Panam??</option>
                                <option value="PG">Papua New Guinea</option>
                                <option value="PY">Paraguay</option>
                                <option value="PH">Pilipinas</option>
                                <option value="PN">Pitcairn</option>
                                <option value="PL">Polska</option>
                                <option value="PT">Portugal</option>
                                <option value="PR">Puerto Rico</option>
                                <option value="QA">???????? ??????</option>
                                <option value="RE">R??union</option>
                                <option value="RO">Rom??nia</option>
                                <option value="RU">R???????????????????? ??????????????????</option>
                                <option value="RW">Rwanda</option>
                                <option value="BL">Saint Barth??lemy</option>
                                <option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
                                <option value="KN">Saint Kitts and Nevis</option>
                                <option value="LC">Saint Lucia</option>
                                <option value="MF">Saint Martin (French part)</option>
                                <option value="PM">Saint Pierre and Miquelon</option>
                                <option value="VC">Saint Vincent and the Grenadines</option>
                                <option value="WS">Samoa</option>
                                <option value="SM">San Marino</option>
                                <option value="ST">S??o Tom?? e Pr??ncipe</option>
                                <option value="SA">?????????????? ?????????????? ????????????????</option>
                                <option value="SN">S??n??gal</option>
                                <option value="RS">????????????</option>
                                <option value="SC">les Seychelles</option>
                                <option value="SL">Sierra Leone</option>
                                <option value="SG">Singapore</option>
                                <option value="SX">Sint Maarten (hollandsk del)</option>
                                <option value="SK">Slovensko</option>
                                <option value="SI">Slovenija</option>
                                <option value="SB">Solomon Islands</option>
                                <option value="SO">Soomaaliya</option>
                                <option value="ZA">South Africa</option>
                                <option value="GS">????????????????????? ?????????????????????????????? ?????? ????????????????????? ??????????????????????????? ???????????????????????????</option>
                                <option value="SS">South Sudan</option>
                                <option value="ES">Espa??a</option>
                                <option value="LK">Sri Lanka</option>
                                <option value="SD">Sudan</option>
                                <option value="SR">Suriname</option>
                                <option value="SJ">Valbard og Jan Mayen</option>
                                <option value="SZ">Swaziland</option>
                                <option value="SE">Sverige</option>
                                <option value="CH">Suisse</option>
                                <option value="SY">?????????????????? ?????????????? ??????????????</option>
                                <option value="TJ">????????????????????</option>
                                <option value="TZ">Tanzania, Jamhuri ya Muungano wa</option>
                                <option value="TH">???????????????????????????</option>
                                <option value="TL">Timor-Leste</option>
                                <option value="TG">Aller</option>
                                <option value="TK">Tokelau</option>
                                <option value="TT">Trinidad and Tobago</option>
                                <option value="TN">????????</option>
                                <option value="TR">T??rkiye</option>
                                <option value="TM">????????????????????????</option>
                                <option value="TC">Turks and Caicos Islands</option>
                                <option value="TV">Tuvalu</option>
                                <option value="UG">Uganda</option>
                                <option value="UA">??????????????</option>
                                <option value="AE">???????????????? ?????????????? ??????????????</option>
                                <option value="GB">United Kingdom</option>
                                <option value="US">United States</option>
                                <option value="UM">United States Minor Outlying Islands</option>
                                <option value="UY">Uruguay</option>
                                <option value="UZ">O'zbekiston</option>
                                <option value="VU">Vanuatu</option>
                                <option value="VE">Venezuela, Bolivarian Republic of</option>
                                <option value="VN">Vi???t Nam</option>
                                <option value="VG">Virgin Islands, British</option>
                                <option value="VI">Virgin Islands, U.S.</option>
                                <option value="WF">Wallis et Futuna</option>
                                <option value="EH">?????????????? ??????????????</option>
                                <option value="YE">??????????</option>
                                <option value="ZM">Zambia</option>
                                <option value="ZW">Zimbabwe</option>
                        </select>

                       
                       <select required name="sex" class="custom-select mb-3" id="country">
                            <option value="">Choose your Gender</option>
                            <option value="1">Male</option>
                            <option value="0">Female</option>
                       </select>
                        <p style="color:white">Your Age</p>     
                       <input type="text"  name="age" required="required">


                       <p style="color:white">Tell us something about yourself </p>     
                       <input type="text" name="description" required="required">
                        <hr>
                   </div>     
                  </div>
                </div>
            </div>
              <div class="container signin" style=" margin-right: auto; margin-left: auto">
                  <div class="form-group">
                    <p style="color:white">By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>   
                    <div class="regis_width">
                        <button type="submit" class="registerbtn" <!--style="width:50rem"-->Register</button>
                    </div> 
                  <!--<button type="submit" class="registerbtn" style="width:50rem">Register</button>-->
                  </div>
                  <p style="color:white">Already have an account? <a href="https://worldchat.azurewebsites.net/WorldChat/">Sign in</a>.</p>
              </div>
            </form>   
        </div>
</body>
</html>
