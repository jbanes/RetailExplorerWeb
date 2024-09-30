<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {

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
                document.getElementById("categories").data(categories);
            });
    });
</script>
<h1>Categories</h1>
<paginated-table id="categories">
    <columns>
        <column href="products.jsp?category={Name}">Name</column>
        <column href="products.jsp?category={Name}&type={Type}">Type</column>
        <column href="products.jsp?subtype={id}">SubType</column>
    </columns>
    <link href="${root}/css/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<paginated-table-pager id="pager" table="#categories">
    <link href="${root}/css/pager.css" rel="stylesheet" type="text/css">
</paginated-table-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
