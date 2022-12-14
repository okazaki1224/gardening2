class Inquiry include ActiveModel::Model
  #emailも必須にする場合は↓やｽﾄﾛﾝｸﾞﾊﾟﾗﾒｰﾀに:emailを追加する
  attr_accessor :nickname, :message
  with_options presence: { message: "を入力してください" } do
    validates :nickname
    #validates :email
    validates :message
  end
end