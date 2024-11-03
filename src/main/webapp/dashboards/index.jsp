<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/includes/header.jsp" />
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
    
    .main {
        flex-grow: 1;
        padding: 0 1rem 0 1rem;
    }
    
    .main h1 {
        margin-block-end: 0;
    }
</style>
<div class="layout">
    <div class="sidebar">
        <img src="../images/under_construction.svg" alt="Under Construction" title="Under Construction">
    </div>
    <div class="main">
        <h1>Coming soon!</h1>
    </div>
</div>
<jsp:include page="../WEB-INF/includes/footer.jsp" />