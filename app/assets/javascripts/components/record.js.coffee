@Record = React.createClass

  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.title).value
      date: ReactDOM.findDOMNode(@refs.date).value
      amount: ReactDOM.findDOMNode(@refs.amount).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      data:
        record: data
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data

  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    alert '1'
    $.ajax
      method: 'DELETE'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteRecord @props.record

  recordRow: ->
    <tr>
      <td>{@props.record.date}</td>
      <td>{@props.record.title}</td>
      <td>{amountFormat(@props.record.amount)}</td>
      <td>
        <button className="btn btn-default" onClick=@handleToggle>Edit</button>
        <button className="btn btn-danger" onClick=@handleDelete>Delete</button>
      </td>
    </tr>

  recordForm: ->
    <tr>
      <td>
        <input className="form-control" type="text" defaultValue={@props.record.date} ref="date" />
      </td>
      <td>
        <input className="form-control" type="text" defaultValue={@props.record.title} ref="title" />
      </td>
      <td>
        <input className="form-control" type="number" defaultValue={@props.record.amount} ref="amount" />
      </td>
      <td>
        <button className="btn btn-default" onClick=@handleEdit>Update</button>
        <button className="btn btn-danger" onClick=@handleToggle>Cancel</button>
      </td>
    </tr>

  render: ->
    if @state.edit
      @recordForm()
    else
      @recordRow()
