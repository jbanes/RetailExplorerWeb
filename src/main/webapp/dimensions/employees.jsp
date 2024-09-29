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
        
    $(document).ready(function() {
        fetch("/services/dimensions/employees?" + params.join('&'))
            .then(response => response.json())
            .then(function(employees) {
                document.getElementById("employees").data(employees);
            });
    });
</script>
<h1>Employees</h1>
<paginated-table id="employees" page-size="10">
    <columns>
        <column>Firstname</column>
        <column>Lastname</column>
        <column>Sex</column>
        <column key="StoreNumber" type="number">Store Number</column>
    </columns>
    <link href="${root}/css/table.css" rel="stylesheet" type="text/css">
</paginated-table>
<paginated-table-pager id="pager" table="#employees">
    <link href="${root}/css/pager.css" rel="stylesheet" type="text/css">
</paginated-table-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
