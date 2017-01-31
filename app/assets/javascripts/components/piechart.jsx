import React from 'react';
import ReactDOM from 'react-dom';
import {PieChart} from 'react-d3';

class Piechart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {pieData: [
      {label: 'Margarita', value: 20.0},
      {label: 'John', value: 55.0},
      {label: 'Tim', value: 25.0 }
    ]};

    // This binding is necessary to make `this` work in the callback
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
    return (
      <PieChart
        data={this.state.pieData}
        width={400}
        height={400}
        radius={100}
        innerRadius={20}
        sectorBorderColor="white"
        title="Stocks of books"
      />
    );
  }
}

ReactDOM.render(
  <Piechart />,
  document.getElementById('piechart')
);