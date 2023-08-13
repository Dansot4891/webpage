<%@ page contentType="text/html;vpageEncoding="utf-8"%>
<%@ page import="dao.*" %>
<%
	out.print((new FeedDAO()).getList());
%>