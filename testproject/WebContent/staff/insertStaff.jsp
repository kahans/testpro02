<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.Dao.*" %>
<%@ page import="net.Dto.*" %>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	SkillDao sDao= new SkillDao();
	ReligionDao rDao=new ReligionDao();
	
%>
<h1>staff���� ��� ȭ��</h1>
<form action="<%=request.getContextPath()%>/staff/insertStaffAction.jsp">
	<table border="1">
		<tr>
			<td>�̸�</td>
			<td colspan="3">
				<input type="text" name="Name" size="15"/>
			</td>
			<td>�ֹι�ȣ</td>
			<td colspan="5">
				<input type="text" name="Sn" size="10"/>-
				<input type="text" name="Sn02" size="10"/>
			</td>
			<td>����</td>
			<td><select name="ReligionNo">
					<option value="">::��������::</option>
					<%
						ArrayList<ReligionDto> getrlist= rDao.searchReligion();
						for(int i=0;i<getrlist.size();i++){
							ReligionDto rDto=getrlist.get(i);	
					%>
						<option value="<%=rDto.getNo()%>"><%=rDto.getRlName() %></option>
					<%
						}
					%>					
				</select>
			</td>
		</tr>
		<tr>
			<td>�з�</td>
			<td colspan="3">
				<input type="radio" name="SchoolNo" value="����"/>����
				<input type="radio" name="SchoolNo" value="��������"/>��������
				<input type="radio" name="SchoolNo" value="�Ϲݴ���"/>�Ϲݴ���
			</td>
			<td>���</td>
			<td colspan="7">
				<%
					ArrayList<SkillDto> getslist = sDao.searchSkill();
					for(int i=0;i<getslist.size();i++){
						SkillDto sDto=getslist.get(i);
				%>
				<input type="checkbox" name="skill" value="<%=sDto.getNo()%>"/><%=sDto.getSkName()%>
				<%
				}
				%>
			</td>
		</tr>
		<tr>
			<td>������</td>
			<td colspan="11">
				<input type="date" name="Graduateday"/>
			</td>
		</tr>
		<tr>
			<td colspan="12" align="center" >
			<input type="submit" value="���"/> |
			<input type="reset" value="�ʱ�ȭ"/>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>