<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
    String uid = (String) session.getAttribute("id");

    session.setAttribute("id", uid);
    
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    String str = "<table align=center>";
    str += "<tr height=40><td><b>작성글 리스트</b></td>";
    str += "<td align=right>";
    str += "<a href='feedAdd.html'><button>글쓰기</button></a>"; 
    str += "</td></tr>";
    
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=240>";
        }    	
        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
    	str += "<td><small>" + feed.getId() + "</small></td>";
    	str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
        str += "</tr>";
    	str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
    	str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
    }
    str += "</table>";
    out.print(str);
%>
</body>
</html>