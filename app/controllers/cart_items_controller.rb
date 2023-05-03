class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(product_id: params[:product_id])
    @cart_item.cart = current_user.cart
    @cart_item.save
    render turbo_stream: turbo_stream.update("cart", partial: "pages/cart")
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    render turbo_stream: turbo_stream.update("cart", partial: "pages/cart")
  end
end
