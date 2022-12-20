class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry=inquiry
    mail(
      from: "gcokzk1224@gmail.com",#送信元アドレス
      to: "gcokzk1224@gmail.com",#送信先アドレス
      subject: "お問い合わせがありました"#件名
    )
  end
end
