<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {var params = [];

        var params = [];

        <c:if test="${not empty param.franchise}">
        params.push("franchise=<c:out value="${param.franchise}" />");
        </c:if>

        <c:if test="${not empty param.brand}">
        params.push("brand=<c:out value="${param.brand}" />");
        </c:if>

        fetch("/services/dimensions/categories?" + params.join('&'))
            .then(response => response.json())
            .then(function(categories) {

                var tbody = $("#categories tbody");

                categories.forEach(function(category) {
                    var tr = $("<tr>");
                    var productsLink = $("<a>")
                            .attr("href", "products.jsp?category=" + category.Name)
                            .text(category.Name);
                    var typeLink = $("<a>")
                            .attr("href", "products.jsp?category=" + category.Name + "&type=" + category.Type)
                            .text(category.Type);
                    var subTypeLink = $("<a>")
                            .attr("href", "products.jsp?subtype=" + category.id)
                            .text(category.SubType);

                    tr.append($("<td>").append(productsLink));
                    tr.append($("<td>").append(typeLink));
                    tr.append($("<td>").append(subTypeLink));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Categories</h1>
<table id="categories">
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>SubType</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
