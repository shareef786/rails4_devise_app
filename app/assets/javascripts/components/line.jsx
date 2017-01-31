"use strict";

import React from 'react';
import ReactDOM from 'react-dom';
import {PieChart} from 'react-d3';
import {LineChart} from 'react-d3';
import {BarChart} from 'react-d3';

(function() {
  // load your general data
  var lineData = [{
    "name": "Series A",
    "values": [
      {x: 10, y:50},
      {x: 20, y:100},
      {x: 30, y:150}
    ]
  }
  ];
  var pieData = [
    {label: 'Margarita', value: 20.0},
    {label: 'John', value: 55.0},
    {label: 'Tim', value: 25.0 }
  ];

  var bardata = [
    {
      "name": 'Series A',
      "values": [
        {x:1, y:50},
        {x:2, y:60},
        {x:4, y:30}
      ]
    }
  ];

ReactDOM.render(
  <LineChart
    legend={true}
    data={lineData}
    width='100%'
    height={400}
    viewBoxObject={
    { x: 0, y: 0, width: 500, height: 400 }
      }
    title="Line Chart"
    yAxisLabel="Price"
    xAxisLabel="Purchased Date (sec)"
    gridHorizontal={true}
  />, document.getElementById('linechart')
);
  ReactDOM.render(
    <PieChart
      data={pieData}
      width={400}
      height={400}
      radius={100}
      innerRadius={20}
      sectorBorderColor="white"
      title="Pie Chart"
    />, document.getElementById('piechart')
  );

  ReactDOM.render(
    <BarChart
      data={bardata}
      width={500}
      height={200}
      fill={'#3182bd'}
      title='Bar Chart'
      yAxisLabel='Label'
      xAxisLabel='Value'
    />, document.getElementById('barchart')
  );


})()