@Book = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/books/#{@props.book.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteBook @props.book
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.book.date
      React.DOM.td null, @props.book.title
      React.DOM.td null, priceFormat(@props.book.price)
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'