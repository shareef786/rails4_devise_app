import React from 'react';
import ReactDOM from 'react-dom';
// import {PieChart} from 'react-d3';
var PieChart = require('react-d3-basic').PieChart;


class Piechart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {pieData: [
      {label: 'Margarita', value: 20.0},
      {label: 'John', value: 55.0},
      {label: 'Tim', value: 25.0 }
    ]};

  }


  componentDidMount() {
    //$.getJSON('/books.json', (response) => { this.setState({ pieData: response }) });
    setInterval(
      () => $.getJSON('/books.json?type=pie', (response) => { this.setState({ pieData: response }) }),
      1000
    );
    //setTimeout(function() {
    //  },
    //  1000);
  }

  render() {
      console.log(this.state.pieData);
      var width = 700,
          height = 400,
          value = function(d) {
              return +d.value;
          },
          name = function(d) {
              console.log(d);
              return d.label;
          },
          chartSeries = [
              {
                  "field": "<5",
                  "name": "less than 5"
              },
              {
                  "field": "5-13",
                  "name": "5 to 13"
              },
              {
                  "field": "14-17",
                  "name": "14 to 17"
              },
              {
                  "field": "18-24",
                  "name": "18 to 24"
              },
              {
                  "field": "25-44",
                  "name": "25 to 44"
              },
              {
                  "field": "45-64",
                  "name": "45 to 64"
              }
          ];
    return (
        <PieChart
            data= {this.state.pieData}
            width= {width}
            height= {height}
            chartSeries= {chartSeries}
            value = {value}
            name = {name}
        />
    );
  }
}

ReactDOM.render(
  <Piechart />,
  document.getElementById('piechart')
);