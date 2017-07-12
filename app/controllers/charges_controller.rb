class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email = current_user.email,
      card: params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      customer = customer.id,
      amount = params[:amount],
      description: "Payment for rental",
      currency: 'usd'
    )
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key]}",
    }
  end
end
