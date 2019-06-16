class Cart < ApplicationRecord

  has_many :order_items

  def total_quantity
    @count = 0

    order_items.all.each do |item|
      @count = @count + item.quantity
    end

    @count
  end

  def total_price_in_pounds
    @total = 0

    order_items.all.each do |item|
      @total = @total + item.product.price_in_pounds * item.quantity
    end

    @total # return this
  end

end
