class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry=inquiry
    mail(
      to: ENV["gcokzk1224@gmail.com"],#送信先アドレス
      subject: "webサイトにお問い合わせがありました"#メールの
    )
  end
end
