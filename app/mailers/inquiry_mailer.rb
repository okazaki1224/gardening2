class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry=inquiry
    mail(
      from: ENV["TOMAIL"],#送信元アドレス
      to: ENV["TOMAIL"],#送信先アドレス
      subject: "お問い合わせがありました"#件名
    )
  end
end
