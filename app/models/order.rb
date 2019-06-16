class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true

  accepts_nested_attributes_for :order_items

  def add_from_cart(cart) # pass in new variable named cart as an arguement

    cart.order_items.all.each do |item|
      self.order_items.new(product: item.product, # self is an Order record for each cart variable, which has_many order_items (e.g. Order.order_items)
         quantity: item.quantity) # the order_items schema shows that order_items can have a product association and a quantity
    end

  end

end
