<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        
        document.querySelectorAll(".table-main, .pager-bar").forEach(function(element) {
            element.classList.add("loading");
        });
        
        fetch("/services/dimensions/stores?franchise=<c:out value="${param.franchise}" />")
            .then(response => response.json())
            .then(function(stores) {
                document.getElementById("stores").data(stores);
                document.querySelectorAll(".loading").forEach(function(element) {
                    element.classList.remove("loading");
                });
            });
    });
</script>
<h1>Stores</h1>
<div class="table-main"> 
    <paginated-table id="stores" page-size="10">
        <columns>
            <column>Name</column>
            <column key="CountryCode" type="centered">Country Code</column>
            <column key="StoreNumber" type="number">Store Number</column>
            <column href="employees.jsp?franchise=${param.franchise}&store={id}" type="number">Employees</column>
        </columns>
        <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
    </paginated-table> 
</div>
<div class="pager-bar">
    <paginated-display table="#stores">
        <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
    </paginated-display>
    <paginated-pager id="pager" table="#stores">
        <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
    </paginated-pager>
</div>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
