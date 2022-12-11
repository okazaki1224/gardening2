class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry=inquiry
    mail(
      to: ENV["TOMAIL"],#送信先アドレス
      subject: "お問い合わせ通知" + @contact.subject_i18n#メールの件名
    )
  end
end
