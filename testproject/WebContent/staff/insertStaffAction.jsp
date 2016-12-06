<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "net.Dto.StaffDto"  %>
<%@ page import = "net.Dao.StaffDao"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("Name");
		String sn = request.getParameter("Sn");
		String sn02 = request.getParameter("Sn02");		
		String snsum=sn+sn02;//앞주민번호와 뒤 주민번호를 붙이기 위함
		System.out.println(snsum+"붙기?");
		String rl=request.getParameter("ReligionNo");
		String scn=request.getParameter("SchoolNo");
		String skill=request.getParameter("skill");
		String day=request.getParameter("Graduateday");
		
		StaffDto sDto = new StaffDto();
		sDto.setName(name);
		sDto.setSn(snsum);
		sDto.setReligionNo(rl);
		sDto.setSchoolNo(scn); 
		sDto.setGraduateday(day);
		
		StaffDao dao = new StaffDao();
		dao.insertStaff(sDto);
		
		System.out.println("aciton");
		
		
	%>
</body>
</html>