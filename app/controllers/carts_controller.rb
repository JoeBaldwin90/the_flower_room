class CartsController < ApplicationController

  def show
    @order_items = Cart.all
  end

end
