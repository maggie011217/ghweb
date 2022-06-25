<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
 
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
 
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>美甲師資訊</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="left" >
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <%
                    String id=request.getParameter("id") ;
                    List allnew=cb.get1Com("select * from ys where id='"+id+"'",10);
                    if(!allnew.isEmpty()){
         			%>
        <TR>
          <TD width=40% align=center>
		  <IMG height=180 src="<%=basePath+allnew.get(3).toString()%>" width=150 onload=makesmallpic(this,180,150); border=0>
		   </TD>
		  <TD align=left><br>
		  美甲師號碼:<%=allnew.get(9).toString()%> 美甲師姓名:<%=allnew.get(1).toString()%> <br>
		  服務類別:<%=allnew.get(2).toString()%>  &nbsp;&nbsp;&nbsp;美甲費用:<%=allnew.get(4).toString()%><br>
		  美甲師職稱:<%=allnew.get(5).toString()%>  <br> 
		  美甲師年齡:<%=allnew.get(6).toString()%> <br>
		  上班時間:<%=allnew.get(8).toString()%>   
		  <a href="<%=basePath%>prepinfo.jsp?ysid=<%=id%>">預約</a>
		  </TD>
		</TR>
		<TR>
          <TD align=center colspan=2><%=allnew.get(7).toString() %>
		  </TD>
		</TR>
		<%}%>
		
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>

 

<%@ include file="iframe/foot.jsp"%>