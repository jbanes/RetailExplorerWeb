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
    
    #chevron-down path {
        transform: rotate(90deg);
        transform-origin: center;
    }
    
    .selection-title {
        font-weight: 500;
        font-size: 120%;
        margin-top: 1rem;
        margin-bottom: 0.3rem;
    }
    
    .item-selection {
        border-radius: 6px;
        min-width: 214px;
        min-height: 5lh;
        max-height: 10lh;
        background-color: white;
        border: 1px solid #AAA;
        padding: 8px;
        overflow: auto;
    }
    
    .item-selection .item {
        cursor: pointer;
        padding: 4px 0px;
        margin: 2px 0px;
        user-select: none;
        -webkit-user-select: none;
    }
    
    .item-selection .item:hover {
        border-radius: 8px;
        background-color: #0474dc;
        color: white;
    }
    
    .item-selection .item[data-selected=true] {
        border-radius: 8px;
        background-color: #2494fc;
        color: white;
    }
    
    .item-selection .item svg {
        width: 16px;
        height: 16px;
        margin: 4px 8px;
        vertical-align: middle;
    }
    
    .main {
        flex-grow: 1;
        padding: 0 1rem 0 1rem;
    }
    
    .main h1 {
        margin-block-end: 0;
    }
    
    .main .toolbar {
        min-height: 1.0lh;
        background-color: #f8f9fa;
        border-radius: 6px;
        margin: 1rem 0;
        padding: 15px 15px;
        vertical-align: bottom;
    }
    
    .main .toolbar button {
        border: 1px solid transparent;
        background-color: #007bff;
        border-radius: 0.25rem;
        color: white;
        cursor: pointer;
        font-size: 1rem;
        user-select: none;
        -webkit-user-select: none;
    }
    
    .main .toolbar button:hover {
        background-color: #0069d9;
    }
    
    .main .toolbar button:active {
        background-color: #2494fc;
    }
    
    .main .table {
        min-height: calc((1lh + 9px) * 11);
    }
    
    @keyframes pulse-animation {
        0% {
            box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.2);
        }
        100% {
            box-shadow: 0 0 0 20px rgba(0, 0, 0, 0);
        }
    }
    
    .pulse {
        animation: pulse-animation 2s infinite;
    }
    
    .pager-bar {
        display: flex;
        align-items: center;
    }
    
    .pager-bar paginated-display {
        flex-grow: 1;
    }
    
    .pager-bar.loading {
        height: 1.5lh;
        overflow: hidden;
        border-top: 16px solid white;
        border-bottom: 16px solid white;
    }
    
    .pager-bar.loading * {
        visibility: hidden;
    }
</style>
<script>
    const svgns = "http://www.w3.org/2000/svg";
    const xlinkns = "http://www.w3.org/1999/xlink";
    const prefix = "${root}/images/symbols.svg";
    
    document.addEventListener("DOMContentLoaded", async function() {
        
        var response = await fetch("/services/analytics/metadata");
        var metadata = await response.json();
        
        var dimensions = document.getElementById("dimensions");
        var measures = document.getElementById("measures");
        var report = document.getElementById("report");
        var updateButton = document.getElementById("update");
        
        var dimensionList = [];
        var measureList = [];
        
        function clearColumns()
        {
            dimensionList.forEach(function(dimension) {
                report.removeColumn(dimension);
            });
            
            measureList.forEach(function(measure) {
                report.removeColumn(measure);
            });
        }
        
        function updateColumns()
        {
            dimensionList.forEach(function(dimension) {
                report.addColumn(dimension, dimension, { "type": "string" });
            });
            
            measureList.forEach(function(measure) {
                report.addColumn(measure, measure, {
                    "type": (measure.includes("$") || measure.includes("Dollar")) ? "money" : "number"
                });
            });
        }
        
        metadata.sort(function(left, right) {
            if(left.name > right.name) return 1;
            if(left.name < right.name) return -1;
            
            return 0;
        });
        
        metadata.forEach(function(record) {
            var element = document.createElement("div");
            var svg = document.createElementNS(svgns, "svg");
            var use = document.createElementNS(svgns, "use");
            var selected = false;
            
            element.dataset.selected = selected;
            element.classList.add("item");
            element.classList.add(record.type);
            
            use.setAttributeNS(xlinkns, "href", prefix + "#blank");
            svg.appendChild(use);
            element.appendChild(svg);
            element.appendChild(document.createTextNode(record.name));
            
            if(record.type === "dimension")
            {
                dimensions.append(element);
            }
            
            if(record.type === "measure")
            {
                measures.append(element);
            }
            
            element.onclick = function() {
                
                var list = (record.type === "measure" ? measureList : dimensionList);

                selected = !selected;
                element.dataset.selected = selected;
                
                use.setAttributeNS(xlinkns, "href", prefix + (selected ? "#circle-check-solid" : "#blank"));
                
                updateButton.classList.add("pulse");
                clearColumns();
                
                if(selected) list.push(record.name);
                else list.splice(list.indexOf(record.name), 1);
                
                updateColumns();
            };
        });
        
        updateButton.onclick = async function() {
            var dimensions = dimensionList.length ? "dimensions=" + dimensionList.join("&dimensions=") : "";
            var measures = measureList.length ? "measures=" + measureList.join("&measures=") : "";
            
            report.data([]);
            updateButton.classList.remove("pulse");
            document.querySelectorAll(".table, .pager-bar").forEach(function(element) {
                element.classList.add("loading");
            });
            
            var response = await fetch("/services/analytics/report?" + dimensions + "&" + measures);
            var data = await response.json();
            
            report.data(data);
            
            document.querySelectorAll(".loading").forEach(function(element) {
                element.classList.remove("loading");
            });
        };
    });
</script>
<div class="layout">
    <div class="sidebar">
        <div class="selection-title">
            <svg width="16" height="16">
                <use xlink:href="${root}/images/symbols.svg#speedometer2"></use>
            </svg>
            Dimensions
        </div>
        <div id="dimensions" class="item-selection"></div>
        <div class="selection-title">
            <svg width="16" height="16">
                <use xlink:href="${root}/images/symbols.svg#beaker"></use>
            </svg>
            Measures
        </div>
        <div id="measures" class="item-selection"></div>
    </div>
    <div class="main">
        <h1>Analytics</h1>
        <div class="toolbar">
            <button id="update">Update</button>
        </div>
        <div class="table">
            <paginated-table id="report">
                <columns>
                </columns>
                <link href="${root}/emirgance/themes/base/paginated/table.css" rel="stylesheet" type="text/css">
                <link href="${root}/css/analytics.css" rel="stylesheet" type="text/css">
            </paginated-table>
        </div>
        <div class="pager-bar">
            <paginated-display table="#report">
                <link href="${root}/emirgance/themes/base/paginated/display.css" rel="stylesheet" type="text/css">
            </paginated-display>
            <paginated-pager id="pager" table="#report">
                <link href="${root}/emirgance/themes/base/paginated/pager.css" rel="stylesheet" type="text/css">
            </paginated-pager>
        </div>
    </div>
</div>
<jsp:include page="../WEB-INF/includes/footer.jsp" />
