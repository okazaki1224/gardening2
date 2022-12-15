class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry=inquiry
    mail(
      to: ENV["TOMAIL"],#送信先アドレス
      subject: "お問い合わせがありました"#件名
    )
  end
end
