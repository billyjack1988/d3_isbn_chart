// set the dimensions and margins of the graph
var margin = {
        top: 20,
        right: 50,
        bottom: 30,
        left: 50
    },
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

// parse the date / time
var parseTime = d3.timeParse("%d-%b-%y");

// set the ranges
var x = d3.scaleTime().range([0, width]);
var y = d3.scaleLinear().range([height, 0]);

// define the 1st line
var valueline = d3.line()
    .x(function(d) {
        return x(d.date);
    })
    .y(function(d) {
        return y(d.ford);
    });

// define the 2nd line
var valueline2 = d3.line()
    .x(function(d) {
        return x(d.date);
    })
    .y(function(d) {
        return y(d.chevy);
    });

var valueline3 = d3.line()
    .x(function(d) {
        return x(d.date);
    })
    .y(function(d) {
        return y(d.dodge);
    });

var valueline4 = d3.line()
    .x(function(d) {
        return x(d.date);
    })
    .y(function(d) {
        return y(d.jeep);
    });


// append the svg obgect to the body of the page
// appends a 'group' element to 'svg'
// moves the 'group' element to the top left margin
var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

d3.csv("csv/cars.csv", function(error, data) {
    if (error) throw error;

    // format the data
    data.forEach(function(d) {
        d.date = parseTime(d.date);
        d.ford = +d.ford;
        d.chevy = +d.chevy;
        d.dodge = +d.dodge;
        d.jeep = +d.jeep
    });

    // Scale the range of the data
    x.domain(d3.extent(data, function(d) {
        return d.date;
    }));
    y.domain([0, d3.max(data, function(d) {
        return Math.max(d.ford, d.chevy, d.dodge, d.jeep);
    })]);

    // Add the valueline path.
    svg.append("path")
        .data([data])
        .attr("class", "line3")
        .attr("d", valueline)
        .attr("text");

    // Add the valueline2 path.
    svg.append("path")
        .data([data])
        .attr("class", "line3")
        .style("stroke", "red")
        .attr("d", valueline2);

    svg.append("path")
        .data([data])
        .attr("class", "line3")
        .style("stroke", "green")
        .attr("d", valueline3);

    svg.append("path")
        .data([data])
        .attr("class", "line3")
        .style("stroke", "yellow")
        .attr("d", valueline4);

    // Add the X Axis
    svg.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    // Add the Y Axis
    svg.append("g")
        .call(d3.axisLeft(y));
    var last_data = data[data.length - 1];

    svg.append("text")
        .attr("transform", "translate(" + (width + 3) + "," + y(last_data.ford) + ")")
        .attr("dy", ".35em")
        .attr("text-anchor", "start")
        .style("fill", "steelblue")
        .text("Ford");

    svg.append("text")
        .attr("transform", "translate(" + (width + 3) + "," + y(last_data.chevy) + ")")
        .attr("dy", ".35em")
        .attr("text-anchor", "start")
        .style("fill", "red")
        .text("Chevy");

    svg.append("text")
        .attr("transform", "translate(" + (width + 3) + "," + y(last_data.dodge) + ")")
        .attr("dy", ".35em")
        .attr("text-anchor", "start")
        .style("fill", "green")
        .text("Dodge");

    svg.append("text")
        .attr("transform", "translate(" + (width + 3) + "," + y(last_data.jeep) + ")")
        .attr("dy", ".35em")
        .attr("text-anchor", "start")
        .style("fill", "yellow")
        .text("Jeep");

});