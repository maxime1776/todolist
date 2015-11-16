class ActivityDetailFooter extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      delivered: false,
      sending: false
    }
  }

  render() {
    var cC = classNames({
      'activity-detail-footer-wrapper': true,
      'is-active': this.props.hasActiveUser
    });

    return(
      <div
        className={cC}
        onClick={this.handleClick.bind(this)}
      >
        <div className="activity-detail-footer is-flex" >
          <div className='activity-detail-footer-user'>
          </div>
          <div className={'activity-detail-footer-action ' + this.props.color}>
            {this.props.activity.name} avec {this.props.user.first_name}
          </div>
        </div>
      </div>
    )
  }

  handleClick(e) {
    e.stopPropagation();
    if (!this.state.sending) {
      this.setState({ sending: true })
      axios.get(Routes.message_twilio_index_path({
        recipient_id: this.props.user.id,
        activity_id: this.props.activity.id
      })).then((data) => {
        PubSub.publish('smsDelivered', this.props.user.id)
        this.props._setActiveUser(false)
      })
    }
  }
}
