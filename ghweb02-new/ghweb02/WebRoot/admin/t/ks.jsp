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
	 
	if(document.form1.ksj.value==""||document.form1.esj.value=="")
	{
		alert("輸入統計時段");
		//document.form2.ddid.focus();
		return false;
	} 
	form1.submit();
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
	 
	 
	  <form action="<%=basePath %>admin/t/ksinfo.jsp" method="post" name="form1"  >  
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <TBODY> 
		  <TR align="center" bgColor=#ffffff>
			<TD  align="center" >服務名稱：<select name="ks"> 
			<option value="">全部服務</option>
    <%List flist=cb.getCom("select * from fenlei order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select>  時間：<input type=text size=20 name=ksj  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>
			 -  <input type=text size=20 name=esj  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>  
     <input class=mmcinb type='button' name='button' value='送出查詢' onclick='abc()'></TD>
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
