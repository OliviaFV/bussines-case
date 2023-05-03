class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items


  def total_price
    total = 0
    self.cart_items.each do |cart_item|
      total += cart_item.product.price
    end
    return total
  end
end
