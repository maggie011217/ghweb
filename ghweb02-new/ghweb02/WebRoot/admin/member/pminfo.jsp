<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %>
<jsp:useBean id="mmb" scope="page" class="com.bean.MemberManageBean" ></jsp:useBean>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
String id=request.getParameter("id");
List list=new ArrayList();
if(id!=null){
	list=mmb.getPerSonMember(Integer.parseInt(id));
}
else{
	String name=request.getParameter("name").trim();
	int memberid=mmb.getID(name);
	list=mmb.getPerSonMember(memberid);
} 
%>
<HTML>
<HEAD>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<title>個人會員資料</title>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</head> 
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath+dir %>/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE width="100%" border=1 height=20 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
<tr><td>&nbsp;</td></tr>
</TABLE>
<TABLE width="100%" border=1 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
   <tr>
   <td align=right width="35%">真實姓名</td><td align=left><%=list.get(0).toString() %></td>
   </tr>
   <tr>
   <td align=right>性別:</td><td align=left><%=list.get(1).toString().trim().equals("m")?"男":"女" %></td>
   </tr>
   <tr>
   <td align=right>出生日期:</td><td align=left><%=list.get(2).toString() %></td>
   </tr>
   <tr>
   <td align=right>籍貫:</td><td align=left><%=list.get(3).toString() %> <%=list.get(4).toString() %></td>
   </tr>
   <tr>
   <td align=right>聯絡電話:</td><td align=left><%=list.get(5).toString() %></td>
   </tr>
   <tr>
   <td align=right>信箱:</td><td align=left><%=list.get(6).toString() %></td>
   </tr>
   <tr>
   <td align=right>密碼保護提示問題:</td><td align=left><%=list.get(7).toString() %></td>
   </tr>
   <tr>
   <td align=right>密碼保護答案:</td><td align=left><%=list.get(8).toString() %></td>
   </tr>
   <tr>
   <td align=right>詳細地址:</td><td align=left><%=list.get(9).toString() %></td>
   </tr>
   <tr>
   <td align=center colspan=2><input type=button value="關閉" onclick="window.close()"></td>
   </tr>
   </table>
  </body>
</html>
