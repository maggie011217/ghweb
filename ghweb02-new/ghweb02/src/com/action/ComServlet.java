package com.action;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addFenLei")){  //���ӷ��� ------����ע��
			 String fl = request.getParameter("bj"); 
			 String str=cBean.getString("select id from fenlei where fl='"+fl+"'");
			 if(str==null){
				 int flag = cBean.comUp("insert into fenlei(fl)  values('"+fl+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/ys/fenlei.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/ys/fenlei.jsp").forward(request, response); 
					} 
			 }
			 else { 
					request.setAttribute("message", "�������}��");
					request.getRequestDispatcher("admin/ys/fenlei.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delFenLei")){  //ɾ������
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from fenlei where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/ys/fenlei.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/ys/fenlei.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delmember")){  //ɾ��ע���û�
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from member where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("addpb")){  //�����Ű���Ϣ
			String ys = request.getParameter("ys"); 
			 String ks = request.getParameter("ks"); 
			 String sj = request.getParameter("sj"); 
			 String xx = request.getParameter("xx"); 
			String str=cBean.getString("select id from pb where ys='"+ys+"' and xx='"+xx+"'"); 
			if(str==null){
				int flag = cBean.comUp("insert into pb(ys,ks,sj,xx)  values('"+ys+"','"+ks+"','"+sj+"','"+xx+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				} 
			}
			else{
				request.setAttribute("message", "ʱ���ͻ��");
				request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
			} 
		}
		else if(method.equals("uppb")){  //�޸��Ű���Ϣ 
			String id = request.getParameter("id");  
			String ys = request.getParameter("ys"); 
			 String ks = request.getParameter("ks"); 
			 String sj = request.getParameter("sj"); 
			 String xx = request.getParameter("xx"); 
			 String str=cBean.getString("select ks from pb where ys='"+ys+"' and xx='"+xx+"' and id!='"+id+"'"); 
			if(str==null){
				int flag = cBean.comUp("update pb set ys='"+ys+"',ks='"+ks+"',sj='"+sj+"',xx='"+xx+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				} 
			}
			else{
				request.setAttribute("message", "�r�g�nͻ��");
				request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
			} 
		}
		 
		else if(method.equals("delpb")){  //ɾ���Ű���Ϣ 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from pb where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/pb/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delys")){  //ɾ�� ����ʦ
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from ys where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/ys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/ys/index.jsp").forward(request, response); 
				} 
		}
		
		 
		 
		//////////////////////////////////////////////////////////ԤԼ  
		else if(method.equals("gh")){  //����ԤԼ
			String member=(String)session.getAttribute("member");
			 
				String ysid = request.getParameter("ysid");  
				String sj = request.getParameter("sj");  
				String xs = request.getParameter("xs");  
				String lxr = request.getParameter("lxr");  
				String lxfs = request.getParameter("lxfs"); 
				//test
				System.out.println("lxfs"+lxfs);
				String str0 = new String(lxfs.getBytes(),"BIG5");
				System.out.println("str1"+str0);
				String str1 = new String(lxfs.getBytes("iso-8859-1"),"utf-8");
				System.out.println("str1"+str1);
				String str3 = new String(lxfs.getBytes("iso-8859-1"),"BIG5");
				System.out.println("str3"+str3);
				String str2 = new String(lxfs.getBytes("utf-8"),"iso-8859-1");
				System.out.println("str2"+str2);
				String str4 = new String(lxfs.getBytes("utf-8"),"BIG5");
				System.out.println("str4"+str4);
				String str5 = new String(lxfs.getBytes("BIG5"),"utf-8");
				System.out.println("str5"+str5);
				String str6 = new String(lxfs.getBytes("BIG5"),"iso-8859-1");
				System.out.println("str6"+str6);
				
				
				String str10 = new String(lxfs.getBytes("iso-8859-1"),"GBK");
				System.out.println("str1"+str10);
				String str30 = new String(lxfs.getBytes("iso-8859-1"),"utf-8");
				System.out.println("str3"+str30);
				String str20 = new String(lxfs.getBytes("utf-8"),"iso-8859-1");
				System.out.println("str2"+str20);
				String str40 = new String(lxfs.getBytes("utf-8"),"GBK");
				System.out.println("str4"+str40);
				String str50 = new String(lxfs.getBytes("GBK"),"utf-8");
				System.out.println("str5"+str50);
				String str60 = new String(lxfs.getBytes("GBK"),"iso-8859-1");
				System.out.println("str6"+str60);
				// test
				
				String xm=cBean.getString("select xm from ys where id='"+ysid+"'");
				String ks=cBean.getString("select ks from ys where id='"+ysid+"'"); 
				String fy=cBean.getString("select fy from ys where id='"+ysid+"'"); 
				String ysbh=cBean.getString("select bh from ys where id='"+ysid+"'"); 
				long bh=System.currentTimeMillis();
					int flag = cBean.comUp("insert into gh(ysid,xm,ks,sj,lxr,lxfs,tjsj,member,bh,fy,xs,ysbh) " +
							"values('"+ysid+"','"+xm+"','"+ks+"','"+sj+"','"+lxr+"','"+lxfs+"','"+date2+"','"+member+"','"+bh+"','"+fy+"','"+xs+"','"+ysbh+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���Ո���Ñ����Ĳ鿴�A�s��̖��");
						request.getRequestDispatcher("ys.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("ys.jsp").forward(request, response); 
					}  
		} 
		 
		else if(method.equals("delgh")){  //ɾ��ԤԼ
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from gh where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/gh/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/gh/index.jsp").forward(request, response); 
				} 
		} 
		else if(method.equals("delgh2")){  //ɾ��ԤԼ
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from gh where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/gh/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/gh/index.jsp").forward(request, response); 
				} 
		} 
		else if(method.equals("delgh3")){  //ɾ��ԤԼ
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("delete from gh where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				} 
		} 
		else if(method.equals("wcgh")){  //ɾ��ԤԼ
			 
			String id = request.getParameter("id");  
			 	int flag = cBean.comUp("update gh set zt='�����' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				} 
		} 
		else if(method.equals("hmd")){  //ɾ��ԤԼ
			 
			String id = request.getParameter("id"); 
			String member=cBean.getString("select member from gh where id='"+id+"'");
			 	int flag = cBean.comUp("update member set hmd='��' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/gh/index2.jsp").forward(request, response); 
				} 
		} 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
