class Public::InquiriesController < ApplicationController
  def new
    #入力画面
    @inquiry=Inquiry.new
    @tags=Tag.mapped
  end

  def confirm
    #確認画面
    @inquiry = Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  def back
    #backアクションを定義しておくことで入力内容を保持したまま前に戻れる
    @inquiry = Inquiry.new(inquiry_params)
    render :new
  end

  def create
    #実際に送信するアクション
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to thanks_path
    else
      render :new
    end
  end

  def thanks
    #お問い合わせありがとう画面
  end


  private
  def inquiry_params
    params.require(:inquiry).permit(:nickname, :message)
  end
end
