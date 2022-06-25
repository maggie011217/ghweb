<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
 <SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<script type="text/javascript">
function f1()             //標示此function用途
{//rs  sj ts lxr lxfs
 	 
 	if(document.form1.sj.value=="")     //標示判斷方法
 	{
 		alert("請填寫時間!");           //標示功能
 		document.form1.sj.focus();
 		return false;
 	}
if(document.form1.lxr.value=="")
 	{
 		alert("請填寫聯絡人!");
 		document.form1.lxr.focus();
 		return false;
 	}if(document.form1.lxfs.value=="")
 	{
 		alert("請填寫聯絡方式!");
 		document.form1.lxfs.focus();
 		return false;
 	}
 form1.submit();
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{ String ysid = request.getParameter("ysid");  
 %>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>我要預約</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>ComServlet?method=gh&ysid=<%=ysid%>" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY> 
		<TR>
          <TD width=45% align=right>預約日期：</TD><TD align=left><input type=text name="sj"  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')"; ><input type=hidden name=ysid value=<%=request.getParameter("ysid")%>></TD>
		</TR> 
		<TR>
          <TD width=45% align=right>預約時間：</TD>
          <TD align=left><select name=xs> 
        <option value="AM 9-10">AM 9-10</option>
        <option value="AM 10-11">AM 10-11</option> 
        <option value="AM 11-12">AM 11-12</option> 
        <option value="PM 3-4">PM 3-4</option> 
        <option value="PM 4-5">PM 4-5</option> 
        </select></TD>
		</TR> 
		<TR>
          <TD  align=right>顧客姓名：</TD><TD align=left><input type=text name=lxr ></TD>
		</TR>
		<TR>
          <TD  align=right>聯絡方式：</TD><TD align=left><input type=text name=lxfs  ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="送出預約"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>

 
<%} %>
</HTML>

<%@ include file="iframe/foot.jsp"%>