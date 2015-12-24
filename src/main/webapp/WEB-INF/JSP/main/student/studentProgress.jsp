<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
    <li id='head'>
        <a href="${CONTEXT}${CURRENT_MAPPING}/home.php">на главную</a>
    </li>
    <li id='back'>
        <a href="${CONTEXT}${CURRENT_MAPPING}/student/students.php">назад</a>
    </li>
</ul>
<div id="tableStud">
    <a border="1" class='textStud'>Отображена успеваемость для следующего студента</a>
    <table border="1">
        <tr>
            <td height="30px" class="columStud"><div class="text">Фамилия</div></td>
            <td height="30px" class="columStud"><div class="text">Имя</div></td>
            <td height="30px" class="columStud"><div class="text">Группа</div></td>
            <td height="30px" class="columStud"><div class="text">Дата поступления</div></td>
        </tr>
        <tr>
            <td height="30px">${student.name}</td>
            <td height="30px">${student.surname}</td>
            <td height="30px">${student.date}</td>
            <td height="30px">${student.group}</td>
        </tr>
    </table>
    <ul>
        <li id="termSelect">
            <form id="form" name="term" method="post">
            <ul>
                <li id='textTermsStud' border="1">
                    <a class="text">Выбрать семестр</a>
                </li>
                <li>
                    <select required id='comboStud' selectedIndex="1" name="sel"><option>выберите семестр</option>
                        <option value="Семестр1">Семестр1</option>
                        <option value="Семестр2">Семестр2</option>
                        <option value="Семестр3">Семестр3</option>
                        <option value="Семестр4">Семестр4</option>
                    </select>

                </li>
                <li>
                    <button id="TermsStudBut" class="btn btn-6 btn-6d"><div>выбрать</div>
                    </button>
                </li>
            </ul>
            </form>
            <div id='averageMark'>
                <a>Средняя оценка за семестр: <c:if test="${param.sel == 'Семестр1'}">
                    ${averageMark1}
                </c:if>
                    <c:if test="${param.sel == 'Семестр2'}">
                        ${averageMark2}
                    </c:if>
                    <c:if test="${param.sel == 'Семестр3'}">
                        ${averageMark3}
                    </c:if>
                    <c:if test="${param.sel == 'Семестр4'}">
                        ${averageMark4}
                    </c:if> балла</a>
            </div>

        </li>
        <li id="tableDisc1">
            <table border="1" id="tb1">
                <tr>
                    <td  height="100px"class="columStud">Дисциплина</td>
                    <td  height="100px"class="columStud">Оценка</td>
                </tr>
                <c:if test="${param.sel == 'Семестр1'}">
                    <c:forEach items="${mark1}" var="mark1">
                        <tr>
                            <td height="100px">${mark1.key.name}</td>
                            <td height="100px">${mark1.value.mark}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${param.sel == 'Семестр2'}">
                <c:forEach items="${mark2}" var="mark2">
                    <tr>
                        <td height="100px">${mark2.key.name}</td>
                        <td height="100px">${mark2.value.mark}</td>
                    </tr>
                </c:forEach>
                </c:if>
                <c:if test="${param.sel == 'Семестр3'}">
                    <c:forEach items="${mark3}" var="mark3">
                        <tr>
                            <td height="100px">${mark3.key.name}</td>
                            <td height="100px">${mark3.value.mark}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${param.sel == 'Семестр4'}">
                    <c:forEach items="${mark2}" var="mark4">
                        <tr>
                            <td height="100px">${mark4.key.name}</td>
                            <td height="100px">${mark4.value.mark}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </li>
    </ul>
</div>
