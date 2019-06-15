class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :current_cart
  helper_method :current_cart

  def current_cart
    # If a new customer visits the site, give them a new cart_id.
    if session[:cart_id].present?
      # They have a cart, let them keep it.
      @current_cart = Cart.find(session[:cart_id])
    else
      # They don't have a cart, create one for them.
      @current_cart = Cart.create # same as Cart.new.save
      session[:cart_id] = @current_cart.id
    end
  end

end
