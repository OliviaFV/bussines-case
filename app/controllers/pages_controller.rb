class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    create_products if Product.all.count == 0
    @products = Product.all
  end

  private

  def create_products
    url = "https://ornate-scone-f87809.netlify.app/api/products.json"
    FetchProductsService.call(url)
  end
end
