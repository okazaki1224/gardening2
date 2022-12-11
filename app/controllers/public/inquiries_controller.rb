class Public::InquiriesController < ApplicationController
  def new
    #入力画面
    @inquiry=Inquiry.new
  end

  def confirm
    #確認画面
    @inquiry=Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  def thanks
    #お問い合わせありがとう画面
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
  end
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:nickname, :email, :message)
  end
end
