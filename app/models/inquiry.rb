class Inquiry include ActiveModel::Model
  attr_accessor :nickname, :email, :message
  with_options presence: { message: "を入力してください" } do
    validates :nickname
    validates :email
    validates :message
  end
end