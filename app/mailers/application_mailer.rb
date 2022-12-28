class ApplicationMailer < ActionMailer::Base
  default from: '自分'
  default to:"gcokzk1224@gmail.com"#元々ENV["TOMAIL"]だった
  layout 'mailer'
end
