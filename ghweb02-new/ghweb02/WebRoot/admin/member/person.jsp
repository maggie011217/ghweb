<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%>
<jsp:useBean id="mb" scope="page" class="com.bean.MemberManageBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>管理員控制台</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%><%=dir %>/member/person.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//如果总頁数为0，那么最后一頁为1，也就是第一頁，而不是第0頁
    form3.action="<%=basePath%><%=dir %>/member/person.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已在第一頁");
  }else{
    form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已在最後一頁");
  }else{
    form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("輸入框只能輸入數字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的頁数超过最后一頁的数，则跳到最后一頁
	  if(pageCount==0){	
	  form3.action="<%=basePath%><%=dir %>/member/person.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%><%=dir %>/member/person.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}

function del()
{
	pageform.submit();
}
function search()
{
	if(document.sform.id.value.replace(/\s+$|^\s+/g,"").length<=0&&document.sform.name.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("請輸入查詢資料:ID或會員名!");
		document.sform.id.focus();
		return false;
	}
	sform.submit();
}
function ts()
{
	if(document.sform.stime.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("請輸入開始時間!");
		document.sform.stime.focus();
		return false;
	}
	if(document.sform.etime.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("請輸入截止時間!");
		document.sform.etime.focus();
		return false;
	}
	document.sform.method.value="TIMESEARCH";
	sform.submit();
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<form action="<%=basePath %>MemberManage?method=DELMEMBER" method="post" name="pageform">
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY>
		  <TR align="center" class=head>
			<TD height=23>號碼</TD>
			<TD>會員名</TD> 
			<TD>註冊時間</TD>
			<TD>登入次數</TD>
			<TD>上次登入時間</TD>
			<TD>上次登入IP</TD> 
			<TD>選擇</TD>
		  </TR>
		<%
			mb.setEVERYPAGENUM(10);
			int cou = mb.getMessageCount();//得到信息总数			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = mb.getMessage(Integer.parseInt(page1)); //带进一个頁数，并返回该頁所要显示的信息 
			session.setAttribute("qqq", pagelist1);
			int pageCount = mb.getPageCount(); //得到頁数  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq");
			 
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					 
	  
			%>   
		  <TR align="center" bgColor=#ffffff>
		    <TD id=map><%=i+1 %></TD>
			<TD id=map>
			<a title="點選查看詳細資訊" href="<%=basePath+dir %>/member/pminfo.jsp?id=<%=pagelist2.get(0).toString()%>" target="_blank">					
			<%=pagelist2.get(1).toString() %>
			</a>
			</TD> 
			<TD id=map><%=pagelist2.get(2).toString() %></TD>
			<TD id=map><%=pagelist2.get(4).toString() %></TD>
			<TD id=map><%=pagelist2.get(5).toString() %></TD>
			<TD id=map><%=pagelist2.get(6).toString() %></TD>
			 
			<TD id=map><a href="<%=basePath%>ComServlet?method=delmember&id=<%=pagelist2.get(0).toString()%>" >刪除</a></TD>
		  </TR>
		<%}%>    	
		 
		
		  </TBODY>
      </TABLE></form>
       </TD>
		</TR>
	     <TR>
    	   <TD align="right" vAlign=top >
             <TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="right" class=head>
			 <TD >
			 <form action="" method="post" name="form3">	
			 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
			 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
							<a href="#" onClick="top()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="pre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				共<%=session.getAttribute("busMessageCount").toString()%>項紀錄,共<%=session.getAttribute("busPageCount").toString()%>頁,目前第<%=session.getAttribute("busPage").toString()%>頁&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="last()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
			 第<input name="busjump" type="text" size="3" />頁<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
             </TD>
             </TR>
			 </TBODY>
			 </TABLE>
		  </TD>
		</TR>
		 
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
