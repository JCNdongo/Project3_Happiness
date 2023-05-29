console.log(data);

// Country names
names = data.map(function (row){
  return row.Country
});

// Trace for happiness score
let trace1 = {
    x: data.map(row => row.Country),
    y: data.map(row => row.Happiness_Score),
    type: "line"
  };

// Data trace array
let traceData = [trace1];

// Apply the group barmode to the layout
let layout = {
  title: "Happiness Score by Country",
};

// Render the plot to the div tag with id "plot"
Plotly.newPlot("plot", traceData, layout);
