class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:ids]
      ids = params[:ids].split(",").map(&:to_i)
      @products = Product.where(id: ids)
    else
      @products = Product.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end
end
