class PagesController < ApplicationController

  def home
    @featured_products = Product.where(is_featured: true).order(created_at: :desc)
  end

  def info

  end

end
