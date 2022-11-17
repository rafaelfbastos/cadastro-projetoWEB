<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="models.AlunoModel"%>
<%@ page import ="models.ProjetoModel"%>
<%@ page import ="repositories.ProjetoRepository"%>
<%@ page import ="repositories.AlunoRepository"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%
    ArrayList<AlunoModel> alunos = AlunoRepository.findAll();
    ArrayList<ProjetoModel> projetos = ProjetoRepository.findAll();
%>

<!DOCTYPE HTML>
<html language="pt-br">
<head>
<meta charset="UTF-8">
</head>
<%
   out.println("<tr>");
   out.println("<td> ID </td>");
   out.println("<td> Título</td>");
   out.println("<td> Area </td>");
   out.println("<td> Cidade</td>");
   out.println("<td> Estado </td>");
   out.println("</tr>");
   out.println("<br>");
   for(ProjetoModel projeto: projetos){
   out.println("<tr>");
   out.println("<td> "+projeto.getId()+" </td>");
   out.println("<td> "+projeto.getTitulo()+" </td>");
   out.println("<td> "+projeto.getArea()+" </td>");
   out.println("<td> "+projeto.getCidade()+" </td>");
   out.println("<td> "+projeto.getEstado()+" </td>");
   out.println("<br>");
   out.println("</tr>");
   }
%>
<body>

</body>
</html>
