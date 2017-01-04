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
      React.createElement SearchBook, handleSearchBook: @searchBook
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'title'
            React.DOM.th null, 'price'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for book in @state.books
            React.createElement Book, key: book.id, book: book, handleDeleteBook: @deleteBook, handleUpdateBook: @updateBook

  addBook: (book) ->
    books = React.addons.update(@state.books, { $push: [book] })
    @setState books: books
  deleteBook: (book) ->
    index = @state.books.indexOf book
    books = React.addons.update(@state.books, {$splice: [[index, 1]]})
    @replaceState books: books
  updateBook: (book, data) ->
    index = @state.books.indexOf book
    books = React.addons.update(@state.books, { $splice: [[index, 1, data]]})
    @replaceState books: books
  searchBook: (data) ->
    @setState books: data