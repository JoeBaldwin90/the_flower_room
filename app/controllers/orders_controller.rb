class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end

end
