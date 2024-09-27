<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
        fetch("/services/dimensions/employees?franchise=<c:out value="${param.franchise}" />&store=<c:out value="${param.store}" />")
            .then(response => response.json())
            .then(function(employees) {

                var tbody = $("#employees tbody");

                employees.forEach(function(employee) {
                    var tr = $("<tr>");

                    tr.append($("<td>").text(employee.Firstname));
                    tr.append($("<td>").text(employee.Lastname));
                    tr.append($("<td>").text(employee.Sex));
                    tr.append($("<td>").text(employee.StoreNumber));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Employees</h1>
<table id="employees">
    <thead>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Sex</th>
            <th>Store Number</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
