<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    
    var params = [];
    
    <c:if test="${not empty param.franchise}">
        params.push("franchise=<c:out value="${param.franchise}" />");
    </c:if>
    
    <c:if test="${not empty param.store}">
        params.push("store=<c:out value="${param.store}" />");
    </c:if>
        
    document.addEventListener("DOMContentLoaded", function() {
        
        document.querySelectorAll(".table-main, .pager-bar").forEach(function(element) {
            element.classList.add("loading");
        });
        
        fetch("/services/dimensions/employees?" + params.join('&'))
            .then(response => response.json())
            .then(function(employees) {
                document.getElementById("employees").data(employees);
                document.querySelectorAll(".loading").forEach(function(element) {
                    element.classList.remove("loading");
                });
            });
    });
</script>
<h1>Employees</h1>
<div class="table-main"> 
    <paginated-table id="employees" page-size="10">
        <columns>
            <column>Firstname</column>
            <column>Lastname</column>
            <column type="centered">Sex</column>
            <column key="StoreNumber" type="number">Store Number</column>
        </columns>
        <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
    </paginated-table>
</div>
<div class="pager-bar">
    <paginated-display table="#employees">
        <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
    </paginated-display>
    <paginated-pager id="pager" table="#employees">
        <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
    </paginated-pager>
</div>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
