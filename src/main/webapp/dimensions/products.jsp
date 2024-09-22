<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <title>Retail Explorer</title>
        <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"></script>
        <script>
            $(document).ready(function() {
                
                var params = [];
                
                <c:if test="${not empty param.brand}">
                params.push("brand=<c:out value="${param.brand}" />");
                </c:if>
                    
                <c:if test="${not empty param.category}">
                params.push("category=<c:out value="${param.category}" />");
                </c:if>
                
                fetch("/services/dimensions/products?" + params.join('&'))
                    .then(response => response.json())
                    .then(function(products) {
                        
                        var tbody = $("#products tbody");
                        
                        products.forEach(function(product) {
                            var tr = $("<tr>");
                            
                            tr.append($("<td>").text(product.Name));
                            tr.append($("<td>").text(product.Price));
                            
                            tbody.append(tr);
                        });
                    });
            });
        </script>
    </head>
    <body>
        <h1>Products</h1>
        <table id="products">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Brand</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </body>
</html>
