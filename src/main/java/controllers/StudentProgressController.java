package controllers;

import dao.impl.StudentDaoImpl;
import dao1.StudentDao;
import entity.Discipline;
import entity.Marks;
import entity.Student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Admin on 13.12.2015.
 */
public class StudentProgressController extends AbstractWebtasksServletHandler {
    private final Map<Integer, String> mappings = new HashMap<Integer, String>();
    public StudentProgressController() {
        mappings.put(ROLE_ADMIN, "/admin");
        mappings.put(ROLE_STUDENT, "/student");

    }
    @Override
    protected void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = Integer.parseInt(request.getParameter("butMark"));
        String s=request.getParameter("sel");
        System.out.println(id);
        StudentDao studentDao = new StudentDaoImpl();
        Student student = studentDao.getStudentById(id);
        Map<Discipline, Marks> mark1=studentDao.mark(id,1);
        Map<Discipline, Marks> mark2=studentDao.mark(id,2);
        Map<Discipline, Marks> mark3=studentDao.mark(id,3);
        Map<Discipline, Marks> mark4=studentDao.mark(id,4);
        double averageMark1=studentDao.average(id,1);
        double averageMark2=studentDao.average(id,2);
        double averageMark3=studentDao.average(id,3);
        double averageMark4=studentDao.average(id,4);
        request.setAttribute("sel", s);
        request.setAttribute("student", student);
        request.setAttribute("mark1", mark1);
        request.setAttribute("mark2", mark2);
        request.setAttribute("mark3", mark3);
        request.setAttribute("mark4", mark4);
        request.setAttribute("averageMark1", averageMark1);
        request.setAttribute("averageMark2", averageMark2);
        request.setAttribute("averageMark3", averageMark3);
        request.setAttribute("averageMark4", averageMark4);
        gotoToJSP("main/student/studentProgress.jsp", request, response);
    }
}
