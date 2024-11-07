<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <c:if test="${not empty param.category}">
        params.push("category=<c:out value="${param.category}" />");
        </c:if>

        <c:if test="${not empty param.type}">
        params.push("type=<c:out value="${param.type}" />");
        </c:if>

        <c:if test="${not empty param.subtype}">
        params.push("subtype=<c:out value="${param.subtype}" />");
        </c:if>
        
        document.querySelectorAll(".table-main, .pager-bar, .toolbar").forEach(function(element) {
            element.classList.add("loading");
        });

        fetch("/services/dimensions/products?" + params.join('&'))
            .then(response => response.json())
            .then(function(products) {
                document.getElementById("products").data(products);
                document.querySelectorAll(".loading").forEach(function(element) {
                    element.classList.remove("loading");
                });
            });
    });
</script>
<h1>Products</h1>
<div class="toolbar">
    <paginated-search table="#products" keys="Name, Brand, Category, Type, SubType, Price">
        <link href="${root}/css/search.css" rel="stylesheet" type="text/css">
    </paginated-search>
</div>
<div class="table-main"> 
    <paginated-table id="products">
        <columns>
            <column>Name</column>
            <column key="BrandName">Brand</column>
            <column key="CategoryName">Category</column>
            <column>Type</column>
            <column>SubType</column>
            <column type="number">Price</column>
        </columns>
        <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
    </paginated-table> 
</div>
<div class="pager-bar">
    <paginated-display table="#products">
        <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
    </paginated-display>
    <paginated-pager id="pager" table="#products">
        <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
    </paginated-pager>
</div>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />