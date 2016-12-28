@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.title && @state.date && @state.amount
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    <form className="form-inline" onSubmit=@handleSubmit>
      <div className="form-group">
        <input type="text" className="form-control" name='date' value={@state.date} placeholder="Date" onChange=@handleChange />
      </div>
      <div className="form-group">
        <input type="text" className="form-control" name='title' value={@state.title} placeholder="Title" onChange=@handleChange />
      </div>
      <div className="form-group">
        <input type="number" className="form-control" name='amount' value={@state.amount} placeholder="Amount" onChange=@handleChange />
      </div>
      <button type="submit" className="btn btn-primary" disabled={!@valid()}>Create record</button>
    </form>
