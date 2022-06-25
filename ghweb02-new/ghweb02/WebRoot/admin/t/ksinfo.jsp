<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=utf-8"%>
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
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//如果总頁数为0，那么最后一頁为1，也就是第一頁，而不是第0頁
    form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已在第一頁");
  }else{
    form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已在最後一頁");
  }else{
    form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+(page+1);
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
	  form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%><%=dir %>/t/ksinfo.jsp?page="+page;
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
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<BODY  >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
     <td width="5%" align="center">ID </td>
      <td  align="center">美甲編號</td>   
      <td  align="center">美甲師姓名</td>
      <td  align="center">服務類別</td>
      <td  align="center">預約時間</td>
      <td  align="center">聯絡人</td>
      <td  align="center">聯絡方式</td>
      <td  align="center">送出時間</td>  
      <td  align="center">用戶</td>    
      <td  align="center">美甲費用</td>  
    </tr>
    <%
    
    String ksj=request.getParameter("ksj");String esj=request.getParameter("esj");  String ks=request.getParameter("ks"); ks=Common.toChineseAndTrim(ks);
  float sum=0;
    		cb.setEVERYPAGENUM(12);
			int cou = cb.getMessageCount("select count(*) from gh where ks like '%"+ks+"%' and sj>='"+ksj+"' and sj<='"+esj+"'");//得到信息总数			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from  gh where ks like '%"+ks+"%'  and sj>='"+ksj+"' and sj<='"+esj+"' order by id desc",11);
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //得到頁数  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq"); 
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i); sum+=Float.parseFloat(pagelist2.get(10).toString());
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>  
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(9).toString() %></td>  
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %> </td> 
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(7).toString() %></td>  
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(8).toString() %></td>   
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(10).toString() %></td>   
    </tr>
	
<%
	}}
%>  
 
	 </TABLE>
	</td>
	</tr>
	<tr bgcolor='#FFFFFF'>
	<td colspan='10' align='right'>
	<TABLE width="100%" border=0 align="right" cellPadding=0 cellSpacing=0>
     <TBODY>
     <TR align="right" >
	 <TD >
	 <form action="" method="post" name="form3">美甲費用總計<%=sum %>	
	 <input type="hidden" name="ks" value="<%=ks %>" />  <input type="hidden" name="ksj" value="<%=ksj %>" /> <input type="hidden" name="esj" value="<%=esj %>" /> 
	 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>項紀錄，共<%=session.getAttribute("busPageCount").toString()%>頁，目前第<%=session.getAttribute("busPage").toString()%>頁&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
	 第<input name="busjump" type="text" size="3" />頁<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
	 </form>
           </TD>
           </TR>
</table>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
