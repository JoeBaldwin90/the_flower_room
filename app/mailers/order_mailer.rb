class OrderMailer < ApplicationMailer

  default from: 'lesley@theflowerroombarnes.com',
          return_path: 'lesley@theflowerroombarnes.com'

  def receipt(order)
    @order = order

    mail to: @order.email, subject: "Thanks for your order"
  end

end
