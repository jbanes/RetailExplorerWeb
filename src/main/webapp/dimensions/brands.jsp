<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/dimensions/header.jsp" />
<script>
    $(document).ready(function() {
        fetch("/services/dimensions/brands")
            .then(response => response.json())
            .then(function(brands) {

                var tbody = $("#brands tbody");

                brands.forEach(function(brand) {
                    var tr = $("<tr>");
                    var cagtegoriesLink = $("<a>")
                            .attr("href", "categories.jsp?brand=" + brand.id)
                            .text(brand.Categories);
                    var productsLink = $("<a>")
                            .attr("href", "products.jsp?brand=" + brand.id)
                            .text(brand.Products);

                    tr.append($("<td>").text(brand.Name));
                    tr.append($("<td>").append(cagtegoriesLink));
                    tr.append($("<td>").append(productsLink));

                    tbody.append(tr);
                });
            });
    });
</script>
<h1>Brands</h1>
<table id="brands">
    <thead>
        <tr>
            <th>Name</th>
            <th>Categories</th>
            <th>Products</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<jsp:include page="../WEB-INF/includes/dimensions/footer.jsp" />
