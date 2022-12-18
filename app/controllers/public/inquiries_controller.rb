class Public::InquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tags

  def new
    #入力画面
    @inquiry=Inquiry.new
  end

  def confirm
    #確認画面
    @inquiry = Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  #def back
    #backアクションを定義しておくことで入力内容を保持したまま前に戻れるが
    #ブラウザの戻るを押されるとエラーが出る場合があるため不採用
    #@inquiry = Inquiry.new(inquiry_params)
    #@tags=Tag.mapped
    #render :new
    #redirect_toに変えても上手くいかず
  #end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
    redirect_to "/inquiries/thanks"
  end

  def thanks
    #お問い合わせありがとう画面(´･ω･`)ここまで
  end

  def set_tags
    @tags=Tag.mapped
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:nickname, :message)
  end
end
