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
            <div>
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
            <div class="selected">
                <svg><use xlink:href="${root}/images/symbols.svg#github"></use></svg>
                Source Code
            </div>
        </a>
    </div>
    <div class="main">
        <h1>Source Code</h1>
        
        <div style="float: right; padding-left: 2em;">
            <img src="../images/osi-badge-light.svg" style="width: 20em;" alt="OSI Approved License" title="OSI Approved License">
        </div>
        <p>Invirgance is interested in promoting improvement in the Technology
        industry. To accomplish this, we are making all of our source code
        freely available under the highly permissive 
        <a href="https://opensource.org/license/mit">MIT License</a>.</p>
        
        <p>This permissive license means that you can use the code in commercial
        projects, customize it, and even fork the projects for your needs without
        releasing your changes.</p>
        
        <h3>Retail Explorer</h3>
        <ul>
            <li><a href="https://github.com/jbanes/RetailExplorerWeb">Frontend</a></li>
            <li><a href="https://github.com/jbanes/RetailExplorerServices">Web Services</a></li>
        </ul>
        <h3>Libraries</h3>
        <ul>
            <li><a href="https://github.com/InvirganceOpenSource/convirgance">Convirgance (Base)</a></li>
            <li><a href="https://github.com/InvirganceOpenSource/convirgance-web">Convirgance (Web Services)</a></li>
            <li><a href="https://github.com/InvirganceOpenSource/convirgance-olap">Convirgane (OLAP)</a></li>
            <li><a href="https://github.com/InvirganceOpenSource/emirgance">Emirgance (JS Web Components)</a></li>
        </ul>
        <h3>Artificial Data Generation</h3>
        <ul>
            <li><a href="https://github.com/jbanes/datagen">Retail Data Generator</a></li>
        </ul>
    </div>
</div>
<jsp:include page="../WEB-INF/includes/footer.jsp" />