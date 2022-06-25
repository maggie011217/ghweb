<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>管理員控制台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
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
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no 
marginheight="0" marginwidth="0"><br><br><br>
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="40%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top height="50%">
	<form action="<%=basePath %>Admin" method="post" name="form1" onSubmit="return checkPWD()">
		 <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
			<TBODY>
			<TR class=head>
			<TD colSpan=2 height=23>修改管理員登入密碼 目前管理員:<FONT color=red><%=username %></FONT>&nbsp;&nbsp;（密碼為6-16字元）</TD></TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>舊密碼:<input type="hidden" name="method" value="editpwd"/></TD>
			<TD width="50%" align="left" id=map><input type="password" name="oldpwd" size="20" maxlength=16  class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"></TD></TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>新密碼:</TD>
			<TD width="50%" align="left" id=map><input type="password" name="newpwd" size="20" maxlength=16 class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"></TD>
			</TR>
			<TR bgColor=#ffffff>
			<TD width="50%" align="right" id=map>確認密碼:</TD>
			<TD width="50%" align="left" id=map><input type="password" name="repwd" size="20" maxlength=16 class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"></TD>
			</TR>
			<TR bgColor=#ffffff>
			<TD colspan="2" align="center" id=map><input type="submit" value="確定">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
			</TR>
			</TBODY>
		</TABLE>
	</form>
   </TD></TR>
</TBODY></TABLE>
</BODY>
<%} %>
</HTML>
