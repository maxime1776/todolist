class UserItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      delivered: false
    }
  }

  render() {
    var user =  this.props.user
    var avatarStyle = {
      backgroundImage: "url('" + user.picture + "')"
    };

    var cC = classNames({
      'user-item': true,
      'is-active': this.props.isActive,
      'has-message': this.state.delivered
    });

    var faCheckClasses = classNames({
      'fa fa-check': true,
      'fadeIn': this.state.delivered
    });

    return(
      <div
        className={cC}
        onClick={this.handleClick.bind(this)}
      >
        <div className='user-item-avatar-container'>
          <div className={'user-item-avatar ' + this.props.color} style={avatarStyle}>
            <i className={faCheckClasses} />
          </div>
        </div>
        <div className='user-item-title'>
          {user.first_name}
        </div>
      </div>
    )
  }

  handleClick(e) {
    if(!this.state.delivered) {
      this.props._setActiveUser(this.props.user)
      e.stopPropagation()
    }
  }

  componentDidMount() {
    PubSub.subscribe('smsDelivered', (msg, data) => {
      if (this.props.user.id == data) {
        this.setState({ delivered: true })
      }
    })
  }
}
