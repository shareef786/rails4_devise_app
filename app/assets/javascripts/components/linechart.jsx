//import React from 'react';
//import ReactDOM from 'react-dom';
//import {LineChart} from 'react-d3';
//
//class Linechart extends React.Component {
//  constructor(props) {
//    super(props);
//    this.state = {lineData: [{
//      "values": [
//        {x: 10, y:50},
//        {x: 20, y:100},
//        {x: 30, y:150}
//      ]
//    } ]};
//
//    // This binding is necessary to make `this` work in the callback
//  }
//  componentDidMount() {
//    //$.getJSON('/books.json', (response) => { this.setState({ pieData: response }) });
//    setInterval(
//      () => $.getJSON('/books.json', (response) => { this.setState({ lineData: response }) }),
//      1000
//    );
//    //setTimeout(function() {
//    //  },
//    //  1000);
//  }
//
//  render (){
//    return (
//      <LineChart
//        data={this.state.lineData}
//        width='100%'
//        height={400}
//        viewBoxObject={
//        { x: 0, y: 0, width: 500, height: 400 }
//          }
//        title="Line Chart"
//        yAxisLabel="Stocks"
//        xAxisLabel="Books"
//        gridHorizontal={true}
//      />
//    )
//  }
//}
//
//ReactDOM.render(
//  <Linechart />,
//  document.getElementById('linechart')
//);