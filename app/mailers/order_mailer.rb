class OrderMailer < ApplicationMailer

  def receipt(order)
    @order = order

    mail to: @order.email, subject: "Thanks for your order"
  end

end
