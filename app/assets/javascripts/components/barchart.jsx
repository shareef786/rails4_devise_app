import React from 'react';
import ReactDOM from 'react-dom';
import {BarChart} from 'react-d3';

class Barchart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {barData: [{
      "values": [
        {x:1, y:50},
        {x:2, y:60},
        {x:4, y:30}
      ]
    } ]};
  }

  componentDidMount() {
    //$.getJSON('/books.json', (response) => { this.setState({ pieData: response }) });
    setInterval(
      () => $.getJSON('/books.json?type=bar', (response) => { this.setState({ barData: response }) }),
      1000
    );
    //setTimeout(function() {
    //  },
    //  1000);
  }

  render (){
    return (
      <BarChart
        data={this.state.barData}
        width={500}
        height={200}
        fill={'#3182bd'}
        title='Stocks of books'
        yAxisLabel='Stocks'
        xAxisLabel='Books'
      />
    )
  }
}

ReactDOM.render(
  <Barchart />,
  document.getElementById('barchart')
);