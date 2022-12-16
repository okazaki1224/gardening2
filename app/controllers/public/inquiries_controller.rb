class Public::InquiriesController < ApplicationController
  before_action :authenticate_user!

  def new
    #入力画面
    @inquiry=Inquiry.new
    @tags=Tag.mapped
  end

  def confirm
    #確認画面
    @inquiry = Inquiry.new(inquiry_params)
    @tags=Tag.mapped
    render :new unless @inquiry.valid?
  end

  #def back
    #backアクションを定義しておくことで入力内容を保持したまま前に戻れるga
    #ブラウザの戻るを押されるとエラーが出る場合があるため不採用
    #@inquiry = Inquiry.new(inquiry_params)
    #@tags=Tag.mapped
    #render :new
    #redirect_toに変えても上手くいかず
  #end

  def thanks
    #お問い合わせありがとう画面
    @tags=Tag.mapped
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:nickname, :message)
  end
end
