class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default to: ENV["TOMAIL"]
  layout 'mailer'
end
