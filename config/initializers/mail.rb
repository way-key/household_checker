ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  port:                 587,
  address:              'smtp.gmail.com',
  domain:               'smtp.gmail.com',
  user_name:            ENV['GMAIL_MAIL'],
  password:             ENV['GMAIL_PASSWORD'],
  authentication:       'login',
  enable_starttls_auto: true
}
