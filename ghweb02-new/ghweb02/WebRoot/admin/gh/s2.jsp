<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%>
 <jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML><HEAD>
<LINK href="<%=basePath %>member/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>member/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %>images/css/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>member/images/city.js"></SCRIPT>
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
<script type="text/javascript">
 
function abc()
{
	if(document.form.word.value=="" )
	{
		alert("請輸入查詢內容!");
		document.form.word.focus();
		return false;
	} 
}
</script>
 
<%
	String user=(String)session.getAttribute("user");
	//String type=(String)session.getAttribute("type");
	if(user==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
	 
	 
	  <form action="<%=basePath %>admin/gh/s2info.jsp" method="post" name="form" onsubmit="return abc()" >  
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY> 
		  <TR align="center" bgColor=#ffffff>
			<TD  align="center" >查詢類型:<select name=lx> 
        <option value="member">用戶名</option> 
        <option value="bh">預約號碼</option>
        <option value="ks">服務</option>
        <option value="sj">預約日期</option> 
        </select> 查詢內容:<input type=text size=20 name=word > <input type="submit" value="提交"> 如按日期查詢，請注意日期格式為:0000-00-00</TD>
		  </TR> 
		</TBODY>
	   </TABLE>
	  </form>
    </TD>
  </TR>
  </TBODY>
</TABLE> 
</BODY>
<%} %>
</HTML>
