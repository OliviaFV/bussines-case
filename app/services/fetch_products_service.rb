require 'httparty'

class FetchProductsService < ApplicationService
  def initialize(url)
    @url = url
  end


  def call
    response = HTTParty.get(@url)

    if response.code == 200
      products = JSON.parse(response.body)["data"]

      products.each do |data|
        create_product(data)
      end
    else
      Rails.logger.error("Failed to fetch API")
    end
  end

  private

  def create_product(data)
    Product.create(
      name: data["name"],
      description: data["description"],
      price: data["price"],
      image: data["image"]
    )
  end
end
