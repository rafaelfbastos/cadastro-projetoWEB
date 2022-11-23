package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.AlunoModel;
import models.ProjetoModel;
import repositories.AlunoRepository;
import repositories.ProjetoRepository;


import java.io.IOException;
import java.lang.reflect.Array;
import java.util.*;


@WebServlet(urlPatterns = {"/Controller", "/projetos", "/index", "/aluno",
        "/cadastrar-aluno", "/apagar-projeto", "/cadastrar",
        "/atualizar-projeto", "/atualizar", "/pesquisar-aluno",
        "/atualizar-aluno", "/listar-projeto-aluno", "/sobre",
        "/apagar-aluno"
})
public class Controller extends HttpServlet {
    private Map<String, Object> alert;
    private ArrayList<String> mensagens;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();

        if (path.equals("/projetos")) {
            listarProjetos(req, resp);
        } else if (path.equals("/index")) {
            resp.sendRedirect("index.jsp");
        } else if (path.equals("/aluno")) {
            resp.sendRedirect("aluno-cadastro.jsp");
        } else if (path.equals("/cadastrar-aluno")) {
            cadastrarAluno(req, resp);
        } else if (path.equals("/apagar-projeto")) {
            apagarProjeto(req, resp);
        } else if (path.equals("/atualizar-projeto")) {
            String id = req.getParameter("id");
            ProjetoModel projeto = ProjetoRepository.dao.findByID(id);
            req.setAttribute("projeto", projeto);
            RequestDispatcher rd = req.getRequestDispatcher("atualizar-projeto.jsp");
            rd.forward(req, resp);
        } else if (path.equals("/pesquisar-aluno")) {
            resp.sendRedirect("aluno.jsp");
        } else if (path.equals("/atualizar-aluno")) {
            int matricula = Integer.parseInt(req.getParameter("matricula"));
            AlunoModel aluno = AlunoRepository.findByMatricula(matricula);

            req.setAttribute("aluno", aluno);
            RequestDispatcher rd = req.getRequestDispatcher("atualizar-aluno.jsp");
            rd.forward(req, resp);
        } else if (path.equals("/listar-projeto-aluno")) {
            listarProjetosAluno(req, resp);
        } else if (path.equals("/sobre")) {
            resp.sendRedirect("sobre.jsp");
        } else if (path.equals("/apagar-aluno")) {
            apagarAluno(req, resp);
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();

        if (path.equals("/aluno")) {
            resp.sendRedirect("aluno-cadastro.jsp");
        } else if (path.equals("/cadastrar-aluno")) {
            cadastrarAluno(req, resp);
        } else if (path.equals("/cadastrar")) {
            cadastrarProjeto(req, resp);
        } else if (path.equals("/atualizar")) {
            atualizarProjeto(req, resp);
        } else if (path.equals("/pesquisar-aluno")) {
            pesquisarAluno(req, resp);
        } else if (path.equals("/atualizar-aluno")) {
            atualizarAluno(req, resp);
        }
    }


    private void listarProjetos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<ProjetoModel> projetos = ProjetoRepository.findAll();
        req.setAttribute("projetos", projetos);
        RequestDispatcher rd = req.getRequestDispatcher("projetos.jsp");
        rd.forward(req, resp);

    }

    protected void cadastrarAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<String> inputs = new ArrayList<>(
                req.getParameterMap().values().stream().map(e -> String.join(" ", e)).toList()
        );

        alert = new HashMap<>();

        int matricula = Integer.parseInt(inputs.get(0));

        if (AlunoRepository.findByMatricula(matricula) == null) {
            AlunoModel aluno = new AlunoModel();
            aluno.setMatricula(matricula);
            aluno.setNome(inputs.get(1));
            aluno.setEmail(inputs.get(2));
            aluno.setTelefone(inputs.get(3));
            aluno.setCurso(inputs.get(4));
            aluno.setSenha(inputs.get(5).hashCode());
            AlunoRepository.gravar(aluno);
            alert.put("class", "alert alert-success");
            mensagens = new ArrayList<>();
            mensagens.add("Aluno cadastrado com sucesso.");
            alert.put("mensagem", mensagens);

        } else {
            alert.put("class", "alert alert-danger");
            mensagens = new ArrayList<>();
            mensagens.add("Aluno já cadastrado.");
            alert.put("mensagem", mensagens);
        }

        req.setAttribute("alert", alert);
        RequestDispatcher rd = req.getRequestDispatcher("aluno-cadastro.jsp");
        rd.forward(req, resp);


    }

    protected void cadastrarProjeto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        alert = new HashMap<>();

        ArrayList<String> inputs = new ArrayList<>(
                req.getParameterMap().values().stream().map(e -> String.join(" ", e)).toList()
        );

        ArrayList<Integer> matriculas = new ArrayList<>(
                inputs.subList(5, inputs.size()).stream().filter(s -> !s.isEmpty()).map(Integer::parseInt).toList()
        );
        mensagens = new ArrayList<>();
        Set<AlunoModel> alunos = new HashSet<>();
        matriculas.forEach(matricula -> {
            AlunoModel aluno = AlunoRepository.findByMatricula(matricula);
            if (aluno != null) {
                alunos.add(aluno);
            } else {
                mensagens.add(String.format("O aluno de matrícula %d precisa ser cadastrado:", matricula));
            }
        });
        if (mensagens.size() > 0) {
            alert.put("class", "alert alert-danger");
            alert.put("mensagem", mensagens);

            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("aluno-cadastro.jsp");
            rd.forward(req, resp);
        } else {
            ProjetoModel projeto = new ProjetoModel();
            projeto.setTitulo(inputs.get(0));
            projeto.setArea(inputs.get(1));
            projeto.setCidade(inputs.get(2));
            projeto.setEstado(inputs.get(3));
            projeto.setDescricao(inputs.get(4));
            projeto.setAlunos(new ArrayList<>(alunos));

            ProjetoRepository.add(projeto);
            mensagens.add("Projeto cadastrado com sucesso");
            alert.put("class", "alert alert-success");
            alert.put("mensagem", mensagens);

            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.forward(req, resp);
        }

    }

    protected void apagarProjeto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("projeto");
        int senha = req.getParameter("senha").hashCode();
        ProjetoModel projeto = ProjetoRepository.dao.findByID(id);
        if (projeto != null) {

            ArrayList<Integer> senhas = new ArrayList<>(
                    projeto.getAlunos().stream().map(AlunoModel::getSenha).toList()
            );

            if (senhas.contains(senha)) {
                ProjetoRepository.delete(projeto);
                mensagens = new ArrayList<>(Arrays.asList("Projeto apagado com sucesso!"));
                alert = new HashMap<>();
                alert.put("class", "alert alert-success");
                alert.put("mensagem", mensagens);
            } else {
                mensagens = new ArrayList<>(Arrays.asList("Senha não confere"));
                alert = new HashMap<>();
                alert.put("class", "alert alert-danger");
                alert.put("mensagem", mensagens);
            }

            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("projetos.jsp");
            ArrayList<ProjetoModel> projetos = ProjetoRepository.findAll();
            req.setAttribute("projetos", projetos);
            rd.forward(req, resp);
        }
    }

    protected void atualizarProjeto(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        alert = new HashMap<>();

        ArrayList<String> inputs = new ArrayList<>(
                req.getParameterMap().values().stream().map(e -> String.join(" ", e)).toList()
        );

        ArrayList<Integer> matriculas = new ArrayList<>(
                inputs.subList(6, inputs.size() - 1).stream().filter(s -> !s.isEmpty()).map(Integer::parseInt).toList()
        );

        mensagens = new ArrayList<>();

        Set<AlunoModel> alunos = new HashSet<>();
        matriculas.forEach(matricula -> {
            AlunoModel aluno = AlunoRepository.findByMatricula(matricula);
            if (aluno != null) {
                alunos.add(aluno);
            } else {
                mensagens.add(String.format("O aluno de matrícula %d precisa ser cadastrado:", matricula));
            }
        });
        if (mensagens.size() > 0) {
            alert.put("class", "alert alert-danger");
            alert.put("mensagem", mensagens);

            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("aluno-cadastro.jsp");
            rd.forward(req, resp);
        } else {

            ProjetoModel projeto = ProjetoRepository.dao.findByID(inputs.get(0));

            ArrayList<Integer> senhas = new ArrayList<>(
                    projeto.getAlunos().stream().map(AlunoModel::getSenha).toList()
            );

            if (senhas.contains(inputs.get(inputs.size() - 1).hashCode())) {
                projeto.setTitulo(inputs.get(1));
                projeto.setArea(inputs.get(2));
                projeto.setCidade(inputs.get(3));
                projeto.setEstado(inputs.get(4));
                projeto.setDescricao(inputs.get(5));
                projeto.setAlunos(new ArrayList<>(alunos));

                ProjetoRepository.update(projeto);
                mensagens.add("Projeto atualizado com sucesso");
                alert.put("class", "alert alert-success");
                alert.put("mensagem", mensagens);

                ArrayList<ProjetoModel> projetos = ProjetoRepository.findAll();

                req.setAttribute("projetos", projetos);
                req.setAttribute("alert", alert);

                RequestDispatcher rd = req.getRequestDispatcher("projetos.jsp");
                rd.forward(req, resp);
            } else {
                mensagens.add("Senha incorreta");
                alert.put("class", "alert alert-danger");
                alert.put("mensagem", mensagens);

                req.setAttribute("alert", alert);
                req.setAttribute("projeto", projeto);

                RequestDispatcher rd = req.getRequestDispatcher("atualizar-projeto.jsp");
                rd.forward(req, resp);
            }


        }

    }

    private void pesquisarAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        alert = new HashMap<>();
        mensagens = new ArrayList<>();

        int matricula = Integer.parseInt(req.getParameter("inputMatricula"));

        AlunoModel aluno = AlunoRepository.findByMatricula(matricula);

        if (aluno != null) {

            ArrayList<ProjetoModel> projetos = new ArrayList<>(aluno.getProjetos());
            req.setAttribute("aluno", aluno);
            req.setAttribute("projetos", projetos);
            RequestDispatcher rd = req.getRequestDispatcher("aluno.jsp");
            rd.forward(req, resp);
        } else {
            alert.put("class", "alert alert-danger");
            mensagens.add("Aluno não encontrado.");
            alert.put("mensagem", mensagens);

            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("aluno.jsp");
            rd.forward(req, resp);

        }

    }

    protected void atualizarAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<String> inputs = new ArrayList<>(
                req.getParameterMap().values().stream().map(e -> String.join(" ", e)).toList()
        );

        alert = new HashMap<>();

        int matricula = Integer.parseInt(inputs.get(0));

        if (AlunoRepository.findByMatricula(matricula) != null) {
            AlunoModel aluno = AlunoRepository.findByMatricula(matricula);

            if (aluno.getSenha() == inputs.get(5).hashCode()) {
                aluno.setNome(inputs.get(1));
                aluno.setEmail(inputs.get(2));
                aluno.setTelefone(inputs.get(3));
                aluno.setCurso(inputs.get(4));
                AlunoRepository.update(aluno);
                alert.put("class", "alert alert-success");
                mensagens = new ArrayList<>();
                mensagens.add("Cadastro atualizado com sucesso.");
                alert.put("mensagem", mensagens);
                req.setAttribute("aluno", aluno);
                req.setAttribute("alert", alert);
                RequestDispatcher rd = req.getRequestDispatcher("aluno.jsp");
                rd.forward(req, resp);
            } else {

                alert.put("class", "alert alert-danger");
                mensagens = new ArrayList<>();
                mensagens.add("Senha não confere.");
                alert.put("mensagem", mensagens);
                req.setAttribute("aluno", aluno);
                req.setAttribute("alert", alert);
                RequestDispatcher rd = req.getRequestDispatcher("atualizar-aluno.jsp");
                rd.forward(req, resp);

            }

        } else {
            alert.put("class", "alert alert-danger");
            mensagens = new ArrayList<>();
            mensagens.add("Aluno já cadastrado.");
            alert.put("mensagem", mensagens);
        }


    }

    private void listarProjetosAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int matricula = Integer.parseInt(req.getParameter("matricula"));
        AlunoModel aluno = AlunoRepository.findByMatricula(matricula);

        ArrayList<ProjetoModel> projetos = new ArrayList<>(aluno.getProjetos());

        req.setAttribute("projetos", projetos);
        RequestDispatcher rd = req.getRequestDispatcher("projetos.jsp");
        rd.forward(req, resp);

    }

    private void apagarAluno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int matricula = Integer.parseInt(req.getParameter("matricula"));
        int senha = req.getParameter("senha").hashCode();

        AlunoModel aluno = AlunoRepository.findByMatricula(matricula);
        if (aluno.getSenha() == senha) {
            AlunoRepository.delete(aluno);

            alert.put("class", "alert alert-success");
            mensagens = new ArrayList<>();
            mensagens.add("Cadastro apagado com sucesso.");
            alert.put("mensagem", mensagens);
            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("aluno.jsp");
            rd.forward(req, resp);
        } else {

            alert.put("class", "alert alert-danger");
            mensagens = new ArrayList<>();
            mensagens.add("Senha não confere.");
            alert.put("mensagem", mensagens);
            req.setAttribute("aluno", aluno);
            req.setAttribute("alert", alert);
            RequestDispatcher rd = req.getRequestDispatcher("atualizar-aluno.jsp");
            rd.forward(req, resp);

        }
    }
}
