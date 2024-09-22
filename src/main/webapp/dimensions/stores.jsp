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
    </head>
    <body>
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
    </body>
</html>
