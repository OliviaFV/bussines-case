class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart

  after_create :create_user_cart

  def create_user_cart
    cart = Cart.new
    cart.user = self
    cart.save
  end
end
