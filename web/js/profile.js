/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 $(document).ready(function(){
 $(".editlink").on("click", function(e){
 e.preventDefault();
 var dataset = $(this).prev(".datainfo");
 var savebtn = $(this).next(".savebtn");
 var theid   = dataset.attr("id");
 var newid   = theid+"-form";
 var currval = dataset.text();
 
 dataset.empty();
 
 $('<input type="text" name="'+newid+'" id="'+newid+'" value="'+currval+'" class="hlite">').appendTo(dataset);
 
 $(this).css("display", "none");
 savebtn.css("display", "block");
 });
 $(".savebtn").on("click", function(e){
 e.preventDefault();
 var elink   = $(this).prev(".editlink");
 var dataset = elink.prev(".datainfo");
 var newid   = dataset.attr("id");
 
 var cinput  = "#"+newid+"-form";
 var einput  = $(cinput);
 var newval  = einput.attr("value");
 
 $(this).css("display", "none");
 einput.remove();
 dataset.html(newval);
 
 elink.css("display", "block");
 });
 });
 */
function edit_change(field_type) {
    var e = document.getElementByID(field_type);
    e.preventDefault();
    var dataset = $(this).prev(".datainfo");
    var savebtn = $(this).next(".savebtn");
    var theid = dataset.attr("id");
    var newid = theid + "-form";
    var currval = dataset.text();

    dataset.empty();

    $('<input type="text" name="' + newid + '" id="' + newid + '" value="' + currval + '" class="hlite">').appendTo(dataset);

    $(this).css("display", "none");
    savebtn.css("display", "block");
}

function email_ch() {
    edit_change("email");
}

function username_ch() {
    edit_change("username");
}

function language_ch() {
    var e = document.getElementByID("language");
    e.preventDefault();
    var dataset = $(this).prev(".datainfo");
    var savebtn = $(this).next(".savebtn");
    var theid = dataset.attr("id");
    var newid = theid + "-form";
    var currval = dataset.text();

    dataset.empty();

    //$('<input type="text" name="' + newid + '" id="' + newid + '" value="' + currval + '" class="hlite">').appendTo(dataset);
    $('<select name="' + newid + '" id="' + newid + '" value="' + currval + '> <option value="english">English</option> <option value="spanish">Spanish</option> <option value="chinese">Chinese</option> </select>').appendTo(dataset);
    
    $(this).css("display", "none");
    savebtn.css("display", "block");
}

function save_change(field_type) {
    var e = document.getElementByID(field_type);
    e.preventDefault();
    var elink = $(this).prev(".editlink");
    var dataset = elink.prev(".datainfo");
    var newid = dataset.attr("id");

    var cinput = "#" + newid + "-form";
    var einput = $(cinput);
    var newval = einput.attr("value");

    $(this).css("display", "none");
    einput.remove();
    dataset.html(newval);

    elink.css("display", "block");
}

function email_save() {
    save_change("email");
}

function username_save() {
    save_change("username");
}

function language_save() {
    save_change("language");
}
