/* 
 * Copyright 2024 INVIRGANCE LLC
 
 Permission is hereby granted, free of charge, to any person obtaining a copy 
 of this software and associated documentation files (the “Software”), to deal 
 in the Software without restriction, including without limitation the rights to 
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
 of the Software, and to permit persons to whom the Software is furnished to do 
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all 
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
 SOFTWARE.
 */

class PaginatedTablePager extends HTMLElement 
{
    static observedAttributes = ["table"];
    
    #shadow;
    #top;
    
    #table;
    #pages = 10;
    
    constructor() 
    {
        super();
    }
    
    attributeChangedCallback(name, oldValue, newValue)
    {
        if(name === "table") this.table(newValue);
    }
    
    connectedCallback()
    {
        this.#shadow = this.attachShadow({ mode: "open" });
        this.#top = document.createElement("div");
        
        // TODO: This should all be handled by CSS stylesheet
        this.#top.style["user-select"] = "none";
        this.#top.style["-webkit-user-select"] = "none";
        this.#top.style["display"] = "flex";
        this.#top.style["justify-content"] = "space-around";
        this.#top.style["cursor"] = "pointer";
        this.#top.style["font-size"] = "80%";
        
        this.#shadow.appendChild(this.#top);
    }
    
    table(table)
    {
        if(table) 
        {
            if(!(table instanceof HTMLElement))
            {
                table = document.querySelector(table);
            }
            
            if(this.#table) this.#table.unregister(this);
            
            this.#table = table;
            
            this.#table.register(this);
            
            return this;
        }
        
        return this.#table;
    }
    
    render()
    {
        var that = this;
        var pages = Math.min(this.#pages, this.#table.pages());
        var selected = this.#table.page();
        var total = this.#table.pages();
        var start = Math.max(0, selected - Math.floor(this.#pages / 2) + 1);
        var number;
        
        var first = document.createElement("div");
        var left = document.createElement("div");
        var numbers = document.createElement("div");
        var right = document.createElement("div");
        var last = document.createElement("div");
        
        
        // We're not yet attached
        if(!this.#top) return;
        
        first.innerHTML = "&laquo;";
        left.innerHTML = "&lsaquo;";
        
        for(var i=0; i<pages && start+i<total; i++)
        {
            number = document.createElement("div");
            
            if(start+i === selected)
            {
                number.classList.add("selected");
                number.style["font-weight"] = "bold"; //TODO: Need css styling instead
            }
            
            number.innerText = (start+i+1);
            number.onclick = function(page) { 
                return function() { that.table().page(page); };
            }(start+i);
            
            numbers.appendChild(number);
        }
        
        numbers.style["display"] = "contents";
        
        right.innerHTML = "&rsaquo;";
        last.innerHTML = "&raquo;";
        
        first.onclick = function() { that.table().page(0); };
        left.onclick = function() { that.table().page(that.table().page()-1); };
        right.onclick = function() { that.table().page(that.table().page()+1); };
        last.onclick = function() { that.table().page(that.table().pages()); };
        
        this.#top.replaceChildren();
        this.#top.appendChild(first);
        this.#top.appendChild(left);
        this.#top.appendChild(numbers);
        this.#top.appendChild(right);
        this.#top.appendChild(last);
    }
}

customElements.define("paginated-table-pager", PaginatedTablePager);