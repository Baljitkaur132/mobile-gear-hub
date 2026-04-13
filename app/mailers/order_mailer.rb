class OrderMailer < ApplicationMailer
  default from: 'onboarding@resend.dev'

  def confirmation(order)
    @order = order
    @order_items = order.order_items
    mail(
      to: order.email,
      subject: "Order Confirmed! ##{order.id} - Mobile Gear Hub"
    )
  end
end
