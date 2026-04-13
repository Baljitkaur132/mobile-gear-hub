class CheckoutController < ApplicationController
  def new
    @cart_items = get_cart_items
    @provinces = Province.all.order(:name)
    @subtotal = @cart_items.sum { |item| item[:product].price * item[:quantity] }
    if @cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty!"
    end
  end

  def create
    @cart_items = get_cart_items
    @provinces = Province.all.order(:name)
    province = Province.find(params[:province_id])
    subtotal = @cart_items.sum { |item| item[:product].price * item[:quantity] }

    gst_amount = subtotal * (province.gst / 100)
    pst_amount = subtotal * (province.pst / 100)
    hst_amount = subtotal * (province.hst / 100)
    total = subtotal + gst_amount + pst_amount + hst_amount
    total_cents = (total * 100).round

    begin
      charge = Stripe::PaymentIntent.create(
        amount: total_cents,
        currency: "cad",
        payment_method: params[:stripe_payment_method_id],
        confirm: true,
        automatic_payment_methods: { enabled: true, allow_redirects: "never" },
        description: "Mobile Gear Hub Order"
      )
    rescue Stripe::CardError => e
      @subtotal = subtotal
      flash.now[:alert] = "Payment failed: #{e.message}"
      render :new and return
    rescue Stripe::StripeError => e
      @subtotal = subtotal
      flash.now[:alert] = "Payment error: #{e.message}"
      render :new and return
    end

    order = Order.new(
      user_name: params[:user_name],
      email: params[:email],
      address: params[:address],
      city: params[:city],
      province: province,
      postal_code: params[:postal_code],
      subtotal: subtotal,
      gst_amount: gst_amount,
      pst_amount: pst_amount,
      hst_amount: hst_amount,
      total: total,
      status: "paid",
      stripe_payment_id: charge.id,
      user_id: current_user&.id
    )

    if order.save
      @cart_items.each do |item|
        order.order_items.create!(
          product: item[:product],
          quantity: item[:quantity],
          unit_price: item[:product].price,
          product_name: item[:product].name
        )
      end
      session[:cart] = {}
      session[:last_order_id] = order.id
      OrderMailer.confirmation(order).deliver_later
      redirect_to checkout_confirm_path, notice: "Payment successful! Order placed. Confirmation email sent!"
    else
      @subtotal = subtotal
      flash.now[:alert] = order.errors.full_messages.join(", ")
      render :new
    end
  end

  def confirm
    @order = Order.find_by(id: session[:last_order_id])
    redirect_to root_path, alert: "No order found!" if @order.nil?
  end

  private

  def get_cart_items
    return [] unless session[:cart].present?
    session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      { product: product, quantity: quantity }
    end.compact
  end
end
