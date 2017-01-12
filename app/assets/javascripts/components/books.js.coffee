# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@Books = React.createClass
  getInitialState: ->
    books: @props.data
    show_books_balance: false
  getDefaultProps: ->
    books: []
  render: ->
    React.DOM.div
      className: 'books'
      React.DOM.h2
        className: 'title'
        'Books'
      if @state.show_books_balance
        @balanceBook()
      else
        React.DOM.a
          className: 'pull-right pointer'
          onClick: @displayBalance
          'Check Balance'
      React.createElement BookForm, handleNewBook: @addBook
      React.DOM.hr null
      React.createElement SearchBook, handleSearchBook: @searchBook
      if @state.books.length > 0
        @showBooks()
      else
        @hideBooks()
  showBooks: ->
    React.DOM.table
      className: 'table table-bordered'
      React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Title'
          React.DOM.th null, 'Price'
          React.DOM.th null, 'Purchased Date'
          React.DOM.th null, 'Actions'
      React.DOM.tbody null,
        for book in @state.books
          React.createElement Book, key: book.id, book: book, handleDeleteBook: @deleteBook, handleUpdateBook: @updateBook
  hideBooks: ->
    React.DOM.div
      className: ''
      React.DOM.br null
      React.DOM.br null
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'text-center'
          'No Books Available'
  displayBalance: ->
    @setState show_books_balance: true
  hideBalance: ->
    @setState show_books_balance: false
  balanceBook: ->
    React.DOM.div
      className: ''
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: "success", price: @credits(), text: "Credit"
        React.createElement AmountBox, type: "danger", price: @debits(), text: "Dedit"
        React.createElement AmountBox, type: "info", price: @balance(), text: "Balence"
      React.DOM.a
        className: 'pull-right pointer'
        onClick: @hideBalance
        'Hide Balance'
  addBook: (book) ->
    books = React.addons.update(@state.books, { $push: [book] })
    @setState books: books
  deleteBook: (book) ->
    index = @state.books.indexOf book
    books = React.addons.update(@state.books, { $splice: [[index, 1]] })
    @replaceState books: books
  updateBook: (book, data) ->
    index = @state.books.indexOf book
    books = React.addons.update(@state.books, { $splice: [[index, 1, data]]})
    @replaceState books: books
  searchBook: (data) ->
    @setState books: data
  debits: ->
    debits = @state.books.filter (val) -> val.price < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.price)
    ), 0
   credits: ->
     credits = @state.books.filter (val) -> val.price >= 0
     credits.reduce ( (prev,curr) ->
       prev + parseFloat(curr.price)
     ), 0
  balance: ->
    @debits() + @credits()
