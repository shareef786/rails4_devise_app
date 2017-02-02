import React from 'react';
import ReactDOM from 'react-dom';
import {PieChart} from 'react-d3';

class Piechart extends React.Component {

  constructor(props) {
    super(props);
    this.state = {pieData: [
      //{label: 'Margarita', value: 20.0},
      //{label: 'John', value: 55.0},
      //{label: 'Tim', value: 25.0 }
    ]};

    // This binding is necessary to make `this` work in the callback
  }
  componentDidMount() {
    //$.getJSON('/books.json', (response) => { this.setState({ pieData: response }) });
    setInterval(
      () => $.getJSON('/books.json?type=pie', (response) => { this.setState({ pieData: response }) }),
      1000
    );
  }

  render() {
    if(this.state.pieData.length == 0){
      return (<h4 className="text-center">No books are in stock </h4>)
    }
    return (
      <PieChart
        data={this.state.pieData}
        width={800}
        height={300}
        radius={100}
        innerRadius={20}
        sectorBorderColor="white"
        title="Books Availability by Type"
      />
    );
  }
}

ReactDOM.render(
  <Piechart />,
  document.getElementById('piechart')
);