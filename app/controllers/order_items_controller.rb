class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @quantity = form_params[:quantity]
    @current_cart.order_items.create(product: @product, quantity: @quantity)
    flash[:success] = "Success! You've got stuff to buy in your cart"
    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.update(form_params)
    flash[:success] = "Thanks for updating to your cart"
    redirect_to cart_path
  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.delete
    flash[:success] = "Product removed from cart"
    redirect_to cart_path
  end

  def form_params
    params.require(:order_item).permit(:quantity)
  end

end
