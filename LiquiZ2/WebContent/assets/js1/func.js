/*
 *This is file is for javascript
 */
 
 
/*
 *warning pattern
 */
function showNumberWarning(id,n) {
    var x = $("#"+id).val();
    $("#FW"+id).empty();
    
    eval("var pattern = /[0-9]+.[0-9]{"+n+"}/;");
  
    if (x.match(pattern)==null){
        $("#FW"+id).append("Wrong input!");
    } 
}

var maxwords = 120;  
function check_length(obj, cnt, rem) {
    var ary = obj.value.split(" ");  
    var len = ary.length;  
    cnt.innerHTML = len;  
    rem.innerHTML = maxwords - len;  
    if (len > maxwords) {  
        f("Message in '" + obj.name + "' limited to " + maxwords + " words.");  
        ary = ary.slice(0,maxwords-1);  
        obj.value = ary.join(" ");  
        cnt.innerHTML = maxwords;  
        rem.innerHTML = 0;  
        return false;  
    }  
    return true;  
}  
 
function showWarningPatternAttribute(obj) {
    if (obj.checked) {
        document.getElementById("warningPattern_attribute").style.display="";
    }else{
        document.getElementById("warningPattern_attribute").style.display="none";
    }
}

function showNumberQuestionAttribute(obj) {
    if (obj.checked) {
        document.getElementById("numberQuestion_attribute").style.display="";
    }else{
        document.getElementById("numberQuestion_attribute").style.display="none";
    }
}

function createDropDownChoices(obj) {
    var empty="";
    document.getElementById("dropdown").innerHTML=empty;
    for (var i=1;i<=obj.value;i++) {
        empty+="</br> Option "+(i+4)+":&nbsp<input type=\"text\" name=\"dropdown_choices\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type=\"checkbox\" name=\"dropdown_choices\"></br>";
    }
    document.getElementById("dropdown").innerHTML=empty;
}

function createRadioChoices(obj) {
    var empty="";
    document.getElementById("radio").innerHTML=empty;
    for (var i=1;i<=obj.value;i++) {
        empty+="</br> Option "+(i+4)+":&nbsp<input type=\"text\" name=\"radio_choices\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type=\"checkbox\" name=\"radio_choices\"></br>";
    }
    document.getElementById("radio").innerHTML=empty;
}

function createMultiChoices(obj) {
    var empty="";
    document.getElementById("multichoices").innerHTML=empty;
    for (var i=1;i<=obj.value;i++) {
        empty+="</br> Option "+(i+4)+":&nbsp<input type=\"text\" name=\"multi_choices\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type=\"checkbox\" name=\"multi_choices\"></br>";
    }
    document.getElementById("multichoices").innerHTML=empty;
}

/*
 * Add a css file to the header section. This is useful for dynamically loading
 * the css file depending on the user's preferences.
 */
function appendCSSLink(src){
	  var head = document.getElementsByTagName('head')[0];
	  var link = document.createElement('LINK');
	  link.rel="stylesheet";
	  link.type="text/css";
	  link.href=src;
	  head.appendChild(link);
	}

function appendCSSText(css){
    var head = document.getElementsByTagName('head')[0];
    var s = document.createElement('style');
    s.setAttribute('type', 'text/css');
    if (s.styleSheet) {   // IE
        s.styleSheet.cssText = css;
    } else {                // the world
        s.appendChild(document.createTextNode(css));
    }
    head.appendChild(s);
 }

/*
 * Run a serverside script (the parameter)
 * which prints a JSON string.
 * load the JSON, evaluate it and call initPage() to update the page
 */
var page;
function loadData(serverPage) {
	var json=new XMLHttpRequest();
	json.onreadystatechange=function() {
	  if (json.readyState!=4 || json.status!=200)
		  return;// TODO: Handle error if it doesn't come back
	  eval("page="+json.responseText);
	  initPage();
	}
	json.open("GET",serverPage,true);
	json.send();
}

function f(div, sel) {
	var s = document.createElement("SELECT");
	for (var i = 0; i < sel.length; i+=2) {
		var opt = document.createElement("OPTION");
		opt.value = sel[i];
		opt.text = sel[i+1];
		s.appendChild(opt);
	}
	div.appendChild(s);
}
/*
 * When a selection happens in the highlight function, call here 
 *
 */
var selection;
var selectionStart, selectionEnd;
function highlight(code) {
	selectionStart = code.selectionStart;
	selectionEnd = code.selectionEnd;
	selection = (code.value).substring(selectionStart,selectionEnd);
}

var commentList = [];
function addComment() {
	commentList.push(selectionStart);
	commentList.push(selectionStop);
	commentList.push(selection);
	alert(commentList);
}

function initPage() {
	appendCSSLink("assets/css/" + page.css + ".css");	
	thisPage();
}

function submitComments() {
	alert(commentList);
} 
/*For menu dropdown showing and hiding in testListQuizzes.html*/
function expand(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuHover";
  d.className = "menuHover";
}
function collapse(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuNormal";
  d.className = "menuNormal";
}

