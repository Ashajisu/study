<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="bbs.Bbs" %>			
<%@ page import="bbs.BbsDAO" %>			
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap_v3.3/css/bootstrap.css"><title>Insert title here</title>
</head>
<body>
	<%	
		//���� �α��� ���� �ҷ�����
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");			
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ȵǾ� �ֽ��ϴ�. �α��� �������� �̵��մϴ�.')");
			script.println("lacation.href = 'login.jsp'");
			script.println("</script>");
		}
		
		//�Խñ� ��ȣ Ȯ��
		int bbsID = 0;		
		if(request.getParameter("bbsID")!=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0 ){	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("lacation.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		//�Խñ� �ҷ�����
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		//�ۼ��� Ȯ��
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �����ϴ�.')");
			script.println("lacation.href = 'bbs.jsp'");
			script.println("</script>");
		}
	%>
<!-- 		���������� �̵� ��ư�� class="active"--> 
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>				
			</button>
			<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">����</a></li>
				<li><a href="bbs.jsp">�Խ���</a></li>
				<li class="active"><a href="write.jsp">����</a></li>
			</ul>
			
			<!--�׻� �α��ε� ����  -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" 
							aria-haspopup="true"
							aria-expanded="false">
							ȸ������
							<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
		<h3 style="text-align : center;">���� ȭ��</h3>
	
	
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�Խ��� �ۼ��� ���</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="����" name="bbsTitle" maxlength="50"
							value="<%= bbs.getBbsTitle()%>"></td>
						</tr>				
						<tr>
							<td><textarea class="form-control" placeholder="����" name="bbsContent" maxlength="2048"
							value="<%= bbs.getBbsContent()%>"></textarea></td>
						</tr>				
					</tbody>
				</table>
				<input type="submit" class="btn btn=primary pull-right" value="�ۼ���">
			</form>
		</div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="bootstrap_v3.3/js/bootstrap.js"></script>
	
</body>
</html>