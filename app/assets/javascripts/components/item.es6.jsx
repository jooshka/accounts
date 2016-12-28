class Item extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {item: 'jj'};
  };

  // componentDidMount() {
  //   $.getJSON('/api', (response) =>
  //     { this.setState({ item: response.some }) }
  //   );
  // }

  render () {
    return (
      <div>
        <h2> Rails React starter </h2>
        <div> {this.state.item}</div>
      </div>
    );
  }
}
