@Book = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleUpdate: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.title).value
      date: ReactDOM.findDOMNode(@refs.date).value
      price: ReactDOM.findDOMNode(@refs.price).value
    $.ajax
      method: 'PUT'
      dataType: 'JSON'
      url: "/books/#{@props.book.id}"
      data:
        book: data
      success: (data) =>
        @setState edit: false
        @props.handleUpdateBook @props.book, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/books/#{@props.book.id}"
      dateType: 'JSON'
      success: () =>
        @props.handleDeleteBook @props.book
  render: ->
    if @state.edit
      @bookForm()
    else
      @bookRow()
  bookRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.book.date
      React.DOM.td null, @props.book.title
      React.DOM.td null, priceFormat(@props.book.price)
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  bookForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: @props.book.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'title'
          defaultValue: @props.book.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.book.price
          ref: 'price'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleUpdate
          'Update'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Cancel'
