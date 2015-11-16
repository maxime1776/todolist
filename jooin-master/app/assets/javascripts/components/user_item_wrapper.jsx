class UserItemWrapper extends React.Component {
  constructor(props) {
    super(props)
    this.state = this.initialStates()
  }


  render() {
    var cC = classNames({
      'user-item-wrapper': true,
      'has-active-item': this.state.hasActiveUser
    })
    return(
      <div className={cC} onClick={this.handleClick.bind(this)}>
        <div className="app-container is-flex">
          {this.props.users.map((user) => {
            return(
              <div className="user-item-container">
                <UserItem
                  user={user}
                  isActive={user.id == this.state.activeUser.id}
                  color={this.props.color}

                  _setActiveUser={this.setActiveUser.bind(this)}
                />
              </div>
            )
          })}
        </div>
        <ActivityDetailFooter
          {... this.props}
          user={this.state.activeUser}
          hasActiveUser={this.state.hasActiveUser}

          _setActiveUser={this.setActiveUser.bind(this)}
        />
      </div>
    )
  }

  handleClick() {
    this.setState(this.initialStates())
  }

  setActiveUser(user) {
    if (user) {
      this.setState({
        hasActiveUser: true,
        activeUser: user
      })
    } else {
      this.setState(this.initialStates())
    }
  }

  initialStates() {
    return {
      hasActiveUser: false,
      activeUser: {}
    }
  }
}
