ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               'baci.lindsaar.net',
    user_name:            'vitaliy.bondarenko86',
    password:             'AFA4dd3d',
    openssl_verify_mode:  'none',
    authentication:       :plain,
    enable_starttls_auto: true
}
