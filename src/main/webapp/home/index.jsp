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
        <a href="index.jsp">
            <div class="selected">
                <svg><use xlink:href="${root}/images/symbols.svg#house-fill"></use></svg>
                Home
            </div>
        </a>
        <a href="architecture.jsp">
            <div>
                <svg><use xlink:href="${root}/images/symbols.svg#compass"></use></svg>
                Architecture
            </div>
        </a>
        <a href="source.jsp">
            <div>
                <svg><use xlink:href="${root}/images/symbols.svg#github"></use></svg>
                Source Code
            </div>
        </a>
    </div>
    <div class="main">
        <h1>Home</h1>
        <img src="../images/under_construction.svg" style="float: right;" alt="Under Construction" title="Under Construction">
        <p>Thank you for visiting the Retail Explorer demo application! Please
        feel free to look around and investigate the features on display.</p>
        
        <p>This application serves as a technology demonstration for the upcoming 
           Convirgance suite of technologies from Invirgance. These technologies attempt 
           to challenge the norm with extraordinarily "simple" approaches that are easier 
           to reason on, faster to develop, higher performance, and better aligned with 
           the way computers work.</p>

        <p>Please mind our dust as this application is under active construction. You will
           find numerous bugs and data quality issues that we're working to resolve. We
           hope you enjoy this technology demonstration and encourage you to check back
           regularly for enhancements and updates!</p>

        <p>Despite being under development, we're making all the source code of the application
           and the underlying libraries available for examination and use. We have
           also provided an overview of the architecture used by this application.
           Follow the links on the left if you would like to know more.<p>
        
        <p>Feel free to <a href="mailto:info@invirgance.com">contact 
           us</a> if you have any questions about this demo application or want
           to know more about the Convirgance technology stack.</p>
            
        <p>Check back regularly as we enhance the application and insert
           detailed explanations for how each page is constructed!</p>
    </div>
</div>
<jsp:include page="../WEB-INF/includes/footer.jsp" />