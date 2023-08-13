<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta charset="utf-8" />
<link rel="stylesheet" href="css/core.css">
<link rel="stylesheet" href="css/main.css">
<title>MySNS</title>
</head>
<body>
    <div class="page-hdr">MySNS</div>
    <div class="page-body">
        <div class="page-mnu">
            <div class="menu" onclick="addFeed()">글쓰기</div>
            <div class="menu" onclick="showFriends()">친구보기</div>
            <div class="menu" onclick="showInfo()">내정보</div>
        </div>
        <div id="list" class="section"></div>
    </div>
<%
    String uid = (String) session.getAttribute("id");

    session.setAttribute("id", uid);
    
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    String str = "<table align=center>";
    str += "<td align=right>";
    str += "</td></tr>";
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        str += "<div class='feed'>";
    	str += "<div class='author'>";
    	str += "<div class='photo'>";
    	str += "<td><small>" + feed.getId() + "</small></td>";
        
    	str += "</div>";

    	str += "</div>";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=240>";
        }    	
        
        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
        
        str += "</tr>";
    	str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
    	str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
    	str += "</div>";
    }
    str += "</table>";
    out.print(str);
%>
	<div class="page-body">
		<div class="section mtop-10 mbot-30 pad-24">
            <div class="button" onclick="getNext()">작성글 더보기</div>
        </div>
    </div>
</body>
</html>