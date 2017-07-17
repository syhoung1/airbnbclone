class ChargesController < ApplicationController
  def create
    @tenant = current_user.tenant
    
    @request_id = session[:request_id]
    @request = BookingRequest.find(@request_id)
    
    customer = Stripe::Customer.retrieve(@tenant.stripe_customer_id)
    
    balance = @request.cost
    
    charge = Stripe::Charge.create(
      :customer => params[:stripe_customer_id],
      :amount => balance,
      :description => "Payment for rental",
      :currency => 'usd',
      :card => params[:stripeToken]
    )
    
    if charge.paid
      customer.account_balance -= balance
      customer.save
      @request.destroy
      redirect_to home_listings_path
    end
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  def new
    binding.pry
    @tenant = current_user.tenant
    session[:request_id] = params[:request]
    binding.pry
    
    customer = Stripe::Customer.retrieve(@tenant.stripe_customer_id)
    
  end
end
