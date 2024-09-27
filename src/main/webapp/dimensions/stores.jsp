<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
        fetch("/services/dimensions/stores?franchise=<c:out value="${param.franchise}" />")
            .then(response => response.json())
            .then(function(stores) {

                var tbody = $("#stores tbody");

                stores.forEach(function(store, index) {
                    var tr = $("<tr>");
                    var employeesLink = $("<a>")
                            .attr("href", "employees.jsp?franchise=<c:out value="${param.franchise}" />&store=" + store.id)
                        .text(store.Employees);

                    // Display limit for testing
                    if(index >= 1000) return false;

                    tr.append($("<td>").text(store.Name));
                    tr.append($("<td>").text(store.StoreNumber));
                    tr.append($("<td>").text(store.CountryCode));
                    tr.append($("<td>").append(employeesLink));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Stores</h1>
<table id="stores">
    <thead>
        <tr>
            <th>Name</th>
            <th>Store Number</th>
            <th>Country Code</th>
            <th>Employees</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
