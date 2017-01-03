@BookForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    price: ''
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/books', {book: @state}, (data) =>
      @props.handleNewBook data
      @setState @getInitialState()
      ,'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          name: 'title'
          placeholder: 'Title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'number'
          name: 'price'
          placeholder: 'Price'
          value: @state.price
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Book'
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value
  valid: ->
    @state.title && @state.date && @state.price