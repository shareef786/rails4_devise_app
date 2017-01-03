@Book = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.book.date
      React.DOM.td null, @props.book.title
      React.DOM.td null, priceFormat(@props.book.price)