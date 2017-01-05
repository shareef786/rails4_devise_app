@SearchBook = React.createClass

  handleSearch: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.search).value
    $.ajax
      method: 'GET'
      url: "/search"
      data:
        data
      dataType: 'JSON'
      success: (data) =>
        @props.handleSearchBook data
  render: ->
    React.DOM.form
      className: 'navbar-form navbar-right'
      role: 'search'
#      onSubmit: @handleSearch
      React.DOM.div
        className: 'input-group'
        React.DOM.input
          className: 'form-control'
          placeholder: 'Search.. Book'
          onChange: @handleSearch
          type: 'text'
          ref: 'search'
        React.DOM.div
          className: 'input-group-btn'
          React.DOM.button
            type: 'submit'
            className: 'btn btn-info'
            'Go'