var svg = d3.select("svg"), // this is a call func for d3 to select the svg and apply the margin, width, and height. so its easy to change if needed
        margin = 200,
        width = svg.attr("width") - margin,
        height = svg.attr("height") - margin
    svg.append("text") //the to append the svg again but this will put text is the svg box
       .attr("transform", "translate(100,0)")
       .attr("x", 50)
       .attr("y", 50)
       .attr("font-size", "24px")
       .text("XYZ Foods Stock Price")
    var xScale = d3.scaleBand().range([0, width]).padding(0.4), // Band scales are like ordinal scales except the output range is continuous and numeric. 
        yScale = d3.scaleLinear().range([height, 0]);// 	Construct continuous linear scale where input data (domain) maps to specified output range
    var g = svg.append("g")
               .attr("transform", "translate(" + 100 + "," + 100 + ")");// translate = It essentially provides position coordinates for the elements relative to the origin. 
                                                                        // The value of the ‘transform’ attribute is a <transform-list>, which is defined as a list of transform definitions, which are applied in the order provided. The individual transform definitions are separated by whitespace and/or a comma
    d3.csv("csv/XYZ.csv", function(error, data) {  // this is where the d3 id called to pull your data from you csv. which has to be in you public folder so d3 knows where to find it.
        if (error) { // this is a func to throw up an error if you data isnt right.
            throw error;
        }
        xScale.domain(data.map(function(d) { return d.year; })); // Now that we have loaded our data, we can provide our domain values to the x and y scales.We use data.map() to map our discrete year values to the x scale.
        yScale.domain([0, d3.max(data, function(d) { return d.value; })]);
        g.append("g") // this "g" means group so when you g.append you are calling on all in that group 
         .attr("transform", "translate(0," + height + ")")
         .call(d3.axisBottom(xScale)) // we added anothor group element to our x-axis 
         .append("text")
         .attr("y", height - 250)
         .attr("x", width - 100)
         .attr("text-anchor", "end")
         .attr("stroke", "black") // this is to style you text 
         .text("Year");// this is you text  
        g.append("g")                                        //  we add another group element to hold the y-axis and its components. We add the y-axis using
         .call(d3.axisLeft(yScale).tickFormat(function(d){   // Since our y-axis depicts a currency value, we have formatted our ticks using the tickFormat() method. We have also specified the number of ticks we would like our y-axis to have using ticks(10)
             return "$" + d;
         })
         .ticks(10))
         .append("text")
         .attr("transform", "rotate(-90)")
         .attr("y", 6)
         .attr("dy", "-5.1em")
         .attr("text-anchor", "end")
         .attr("stroke", "black")
         .text("Stock Price");
        g.selectAll(".bar")
         .data(data)
         .enter().append("rect")// We have created dynamic bars with our data using the SVG rectangle element.
         .attr("class", "bar") // We also add a class "bar" to the rectangle element.
         .attr("x", function(d) { return xScale(d.year); }) // We use the x scale created earlier and pass the year value from our data. The x scales returns the corresponding x value from the range specified to our scale. In this case, it is the width of the SVG.
         .attr("y", function(d) { return yScale(d.value); }) // Similarly, we pass the data value to our y scale and receive the corresponding y value from the y range.
         .attr("width", xScale.bandwidth()) // The width of our bars would be determined by the scaleBand() function. So, the x-scale returns a calculated bandwidth from the range and padding provided to the x-scale.
         .attr("height", function(d) { return height - yScale(d.value); }); //The height of the bar would be calculated as height - yScale(d.value). This would be the height of the SVG minus the corresponding y-value of the bar from the y-scale. Remember that the y-value here would be the tip of the bar since it is calculated from the origin and origin is at (0,0).
    })