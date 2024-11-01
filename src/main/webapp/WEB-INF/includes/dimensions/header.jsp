<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../header.jsp" />
<style>
    .layout {
        display: flex;
    }
    
    .sidebar {
        background-color: rgb(248, 249, 250);
        border-right: 1px solid rgb(222, 226, 230);
        padding: 1rem;
        min-height: calc(var(--page-content-height) - 2rem);
    }
    
    .dimension {
        margin-left: 1rem;
        margin-right: 1rem;
        flex-grow: 1;
    }
    
    .sidebar > a > div {
        margin: 0.5rem 0.25rem;
        min-width: 12rem;
        font-weight: 500;
        padding: 4px 20px 4px 12px;
        user-select: none;
        -webkit-user-select: none;
    }
    
    .sidebar > a > div:hover, .sidebar > a > div.selected {
        color: white;
        border-radius: 8px;
        cursor: pointer;
    }
    
    .sidebar > a > div.disabled {
        background-color: transparent !important;
        color: rgb(178, 187, 195) !important;
        cursor: default !important;
    }
    
    .sidebar > a > div.selected {
        background-color: #2494fc;
    }
    
    .sidebar > a > div:hover {
        background-color: #0474dc;
    }
    
    .sidebar > a > div.level1 {
        padding: 4px 4px 4px 28px;
    }
    
    .sidebar > a > div.level2 {
        padding: 4px 4px 4px 56px;
        min-width: 10rem;
    }
    
    .sidebar > a {
        color: inherit;
        text-decoration: none;
    }
    
    .sidebar > a > div svg {
        width: 1rem;
        height: 1rem;
        margin-right: 0.25rem;
        margin-bottom: -0.1rem;
    }
    
    .table-main {
        min-height: calc((1lh + 9px) * 11);
    }
    
    .pager-bar {
        display: flex;
        align-items: center;
    }
    
    .pager-bar paginated-display {
        flex-grow: 1;
    }
    
    .loading * {
        visibility: hidden;
    }
</style>
<div class="layout">
    <div class="sidebar">
        <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/index.jsp')}" scope="page" />
        <a href="index.jsp">
            <div class="${selected ? "selected" : ""}">
                    <svg><use xlink:href="${root}/images/symbols.svg#house-fill"></use></svg>
                    Home
            </div>
        </a>
        <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/franchises.jsp')}" scope="page" />
        <c:set var="child" value="${fn:contains(pageContext.request.requestURL, '/stores.jsp') or fn:contains(pageContext.request.requestURL, '/employees.jsp')}" scope="page" />
        <c:set var="child" value="${child or (fn:contains(pageContext.request.requestURL, '/products.jsp') and fn:contains(pageContext.request.queryString, 'franchise='))}" scope="page" />
        <a href="franchises.jsp">
            <div class="${selected ? "selected" : ""}">
                <svg><use xlink:href="${root}/images/symbols.svg${child ? "#chevron-down" : "#chevron-right"}"></use></svg>
                Franchises
            </div>
        </a>
        <c:if test="${child}">
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/employees.jsp') and not fn:contains(pageContext.request.queryString, 'store=')}" scope="page" />
            <a href="employees.jsp?franchise=<c:out value="${param.franchise}" />">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Employees
                </div>
            </a>
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/products.jsp')}" scope="page" />
            <a href="products.jsp?franchise=<c:out value="${param.franchise}" />">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Products
                </div>
            </a>
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/stores.jsp')}" scope="page" />
            <c:set var="child" value="${fn:contains(pageContext.request.requestURL, '/employees.jsp') and fn:contains(pageContext.request.queryString, 'store=')}" scope="page" />
            <a href="stores.jsp?franchise=<c:out value="${param.franchise}" />">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg${child ? "#chevron-down" : "#chevron-right"}"></use></svg>
                    Stores
                </div>
            </a>
            <c:if test="${child}">
                <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/employees.jsp') and fn:contains(pageContext.request.queryString, 'store=')}" scope="page" />
                <a href="employees.jsp?franchise=<c:out value="${param.franchise}" />&store=<c:out value="${param.store}" />">
                    <div class="${selected ? "selected" : ""} level2">
                        <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                        Employees
                    </div>
                </a>
            </c:if>
        </c:if>
        <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/brands.jsp')}" scope="page" />
        <c:set var="child" value="${(fn:contains(pageContext.request.requestURL, '/products.jsp') or fn:contains(pageContext.request.requestURL, '/categories.jsp')) and fn:contains(pageContext.request.queryString, 'brand=')}" scope="page" />
        <a href="brands.jsp">
            <div class="${selected ? "selected" : ""}">
                <svg><use xlink:href="${root}/images/symbols.svg${child ? "#chevron-down" : "#chevron-right"}"></use></svg>
                Brands
            </div>
        </a>
        <c:if test="${child}">
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/categories.jsp')}" scope="page" />
            <a href="categories.jsp?brand=<c:out value="${param.brand}" />">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Categories
                </div>
            </a>
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/products.jsp')}" scope="page" />
            <a href="products.jsp?brand=<c:out value="${param.brand}" />">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Products
                </div>
            </a>
        </c:if>
        <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/categories.jsp') and not fn:contains(pageContext.request.queryString, 'brand=')}" scope="page" />
        <c:set var="products_page" value="${fn:contains(pageContext.request.requestURL, '/products.jsp')}" scope="page" />
        <c:set var="child" value="${products_page and fn:contains(pageContext.request.queryString, 'category=')}" scope="page" />
        <c:set var="child" value="${child or (products_page and fn:contains(pageContext.request.queryString, 'type='))}" scope="page" />
        <c:set var="child" value="${child or (products_page and fn:contains(pageContext.request.queryString, 'subtype='))}" scope="page" />
        <a href="categories.jsp">
            <div class="${selected ? "selected" : ""}">
                <svg><use xlink:href="${root}/images/symbols.svg${child ? "#chevron-down" : "#chevron-right"}"></use></svg>
                Categories
            </div>
        </a>
        <c:if test="${child}">
            <c:set var="selected" value="${fn:contains(pageContext.request.requestURL, '/products.jsp')}" scope="page" />
            <a href="#">
                <div class="${selected ? "selected" : ""} level1">
                    <svg><use xlink:href="${root}/images/symbols.svg#table"></use></svg>
                    Products
                </div>
            </a>
        </c:if>
    </div>
    <div class="dimension">

