package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AlunoModel;
import repositories.AlunoRepository;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@WebServlet(urlPatterns={"/Controller","/projetos","/index","/aluno","/cadastrar-aluno"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
        if(path.equals("/projetos")){
            resp.sendRedirect("projetos.jsp");
        }
        if(path.equals("/index")){
            resp.sendRedirect("index.jsp");
        }
        if(path.equals("/aluno")){
            resp.sendRedirect("aluno.jsp");
        }
        if(path.equals("/cadastrar-aluno")){
           cadastrarAluno(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
        if(path.equals("/projetos")){
            resp.sendRedirect("projetos.jsp");
        }
        if(path.equals("/index")){
            resp.sendRedirect("index.jsp");
        }
        if(path.equals("/aluno")){
            resp.sendRedirect("aluno.jsp");
        }
        if(path.equals("/cadastrar-aluno")){
            cadastrarAluno(req, resp);
        }
    }


    protected void cadastrarAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<String> inputs = new ArrayList<>(
                req.getParameterMap().values().stream().map(e->String.join(" ",e)).toList()
        );

        Map<String,Object> alert = new HashMap<>();

        int matricula=Integer.parseInt(inputs.get(0));

        if(AlunoRepository.findByMatricula(matricula) == null) {
            AlunoModel aluno = new AlunoModel();
            aluno.setMatricula(matricula);
            aluno.setNome(inputs.get(1));
            aluno.setEmail(inputs.get(2));
            aluno.setTelefone(inputs.get(3));
            aluno.setCurso(inputs.get(4));
            aluno.setSenha(inputs.get(5).hashCode());
            AlunoRepository.gravar(aluno);
            alert.put("class","alert alert-success");
            ArrayList<String> mensagens = new ArrayList<>();
            mensagens.add("Aluno cadastrado com sucesso.");
            alert.put("mensagem",mensagens);

        }else {
            alert.put("class","alert alert-danger");
            ArrayList<String> mensagens = new ArrayList<>();
            mensagens.add("Aluno já cadastrado.");
            alert.put("mensagem",mensagens);
        }

        req.setAttribute("alert",alert);
        RequestDispatcher rd = req.getRequestDispatcher("aluno.jsp");
        rd.forward(req,resp);


    }


}
