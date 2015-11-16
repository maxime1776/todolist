class PhoneForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = { active: false }
  }

  render() {

    var phoneModalClasses = classNames({
      'phone-modal': true,
      'is-active': this.state.active
    });

    return(
      <div className='app-container has-full-size has-center-mode'>
        <div className={phoneModalClasses}>
          <div className='phone-modal-explainer'>
            <div className='phone-modal-explainer-title'>
              Votre numéro de téléphone
            </div>

            <div className='phone-modal-explainer-sub-title'>
              Nous le conservons précieusement, et ne le transmettons uniquement sous votre accord.
            </div>
          </div>
          <div dangerouslySetInnerHTML={{__html: this.props.form}} onClick={this.handleClick.bind(this)} />
          <div className='skip-wrapper'>
            <a href='/'>
              Skip
            </a>
          </div>
        </div>
      </div>
    )
  }

  handleClick() {
    this.setState({ active: true })
  }
}
