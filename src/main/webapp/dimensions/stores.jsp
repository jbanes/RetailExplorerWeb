<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        fetch("/services/dimensions/stores?franchise=<c:out value="${param.franchise}" />")
            .then(response => response.json())
            .then(function(stores) {
                document.getElementById("stores").data(stores);
            });
    });
</script>
<h1>Stores</h1>
<paginated-table id="stores" page-size="10">
    <columns>
        <column>Name</column>
        <column key="CountryCode" type="centered">Country Code</column>
        <column key="StoreNumber" type="number">Store Number</column>
        <column href="employees.jsp?franchise=${param.franchise}&store={id}" type="number">Employees</column>
    </columns>
    <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
</paginated-table> 
<paginated-pager id="pager" table="#stores">
    <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
</paginated-pager>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
