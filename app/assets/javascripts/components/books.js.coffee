# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@Books = React.createClass
  getInitialState: ->
    books: @props.data
  getDefaultProps: ->
    books: []
  render: ->
    React.DOM.div
      className: 'books'
      React.DOM.h2
        className: 'title'
        'Books'
      React.createElement BookForm, handleNewBook: @addBook
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'title'
            React.DOM.th null, 'price'
        React.DOM.tbody null,
          for book in @state.books
            React.createElement Book, key: book.id, book: book

  addBook: (book) ->
    books = @state.books.slice()
    books.push book
    @setState books: books
  handlePrice: (e) ->
    