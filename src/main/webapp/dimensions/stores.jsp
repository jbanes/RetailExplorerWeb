<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
        fetch("/services/dimensions/stores?franchise=<c:out value="${param.franchise}" />")
            .then(response => response.json())
            .then(function(stores) {

                var tbody = $("#stores tbody");

                console.log(stores);

                stores.forEach(function(store) {
                    var tr = $("<tr>");

                    tr.append($("<td>").text(store.Name));
                    tr.append($("<td>").text(store.StoreNumber));
                    tr.append($("<td>").text(store.CountryCode));

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
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
