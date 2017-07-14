class ChargesController < ApplicationController
  def create

    customer = Stripe::Customer.retrieve(params[:stripe_customer_id])

    balance = customer.account_balance
    charge = Stripe::Charge.create(
      customer = params[:stripe_customer_id],
      amount = balance,
      description: "Payment for rental",
      currency: 'usd'
    )

    if charge.paid?
      customer.account_balance = 0
      customer.save
    end

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
