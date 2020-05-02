class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_NAME"], password: ENV["BASIC_AUTH_PASS"]

  def show
    @products_in_db = Product.all.length

    @categories_in_db = Category.all.length
  end
end
