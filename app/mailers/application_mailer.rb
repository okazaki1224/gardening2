class ApplicationMailer < ActionMailer::Base
  default from: '自分'
  default to: ENV["TOMAIL"]
  layout 'mailer'
end
