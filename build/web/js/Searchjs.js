/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var xmlHttp;
function getMoreContents(){
    var content = document.getElementById("keyword");
    if(content.value == ""){
        clearContent();
        return;
    }
    xmlHttp = createXMLHttp(); 
    
    var url = "/WorldChat/DisplaySearchServlet";
    xmlHttp.open("POST",url,true);
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlHttp.onreadystatechange = callback;    
    xmlHttp.send("keyword="+escape(content.value));

}
        
function createXMLHttp(){
   
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

function callback(){
  
    if(xmlHttp.readyState == 4){
        if(xmlHttp.status == 200){
            var result = xmlHttp.responseText;
            var json = eval("("+result+")");
            setContent(json);
        }
    }
}

function setContent(contents){
    clearContent();
    var dataList = document.getElementById('json-datalist');
    var input = document.getElementById('keyword');
    var size = contents.length;
    if(size > 0){
        for(var i = 0; i < size; i++){
            var item = contents[i];
            var option = document.createElement('option');
            option.value = item;
            dataList.appendChild(option);
        }   
   } else {  
   }
}

function clearContent(){
    var datalist = document.getElementById("json-datalist");
    console.log("datalist size:" + datalist.options.length);
    var size = datalist.options.length;
    var cList = document.querySelector("#json-datalist");
    			
    for(var i = size-1;i>=0;i--){		
    	cList.childNodes[i].remove();
    }		
}
    		
function keywordBlur(){
    clearContent();
}




