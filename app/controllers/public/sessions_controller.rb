# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #退会後にログインさせないために↓
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password]) && !(@user.is_deleted==false)
    #&&の右辺→→→if文は条件がどちらもTRUEで初めて以降の処理が実行されるので、
    #該当の会員が[退会している」ことについてTRUEの結果を得る必要がある
    #@user.is_deleted==falseは「退会していない」状態を表すため、（）前に！がついている
    ## 【処理内容3】
      redirect_to new_user_registration_path
      flash[:notice]="再度会員登録をしてからご利用ください！"
    end
  end
end
