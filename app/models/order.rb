class Order < ApplicationRecord
  has_many :order_items

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /\A\d{11}\z/
  postcode_regex = /\As*((GIR\s*0AA)|((([A-PR-UWYZ][0-9]{1,2})|(([A-PR-UWYZ][A-HK-Y][0-9]{1,2})|(([A-PR-UWYZ][0-9][A-HJKSTUW])|([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s*[0-9][ABD-HJLNP-UW-Z]{2}))\s*\z/i

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: email_regex }
  validates :phone_number, presence: true, format: { with: phone_regex }
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true, format: { with: postcode_regex }

  accepts_nested_attributes_for :order_items

  def add_from_cart(cart) # lined with OrdersController.rb
    cart.order_items.all.each do |item|
      self.order_items.new(product: item.product, quantity: item.quantity)
      # self is an Order record, which has_many order_items (e.g. Order.order_items)
      # the order_items schema shows that order_items can have a product association and a quantity
    end
  end

  def order_total_price_in_pounds
    @total = 0

    order_items.all.each do |item|
      @total = @total + (item.quantity * item.product.price) / 100
    end

    @total
  end

  def total_price
    @total = 0

    order_items.each do |item|
      @total = @total + item.product.price * item.quantity
    end

    @total
  end

  def save_and_charge
    if self.valid?
      Stripe::Charge.create(
        amount: self.total_price,
        currency: 'gbp',
        source: self.stripe_token, # obtained with Stripe.js
        description: 'Order for ' + self.email
      )
      self.save
    else
      false # doesn't pass validations
    end

  rescue Stripe::CardError => e
    @message = e.json_body[:error][:message] # from Stripe API docs

    self.errors.add(:stripe_token, @message) # add errors to the model

    false # return false to the controller
  end


end
