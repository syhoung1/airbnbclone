class BookingRequestsController < ApplicationController
  require "stripe"
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  
  def create
    @listing = HomeListing.find(params[:home_listing_id])
    @booking = @listing.booking_requests.new(booking_request_params)
    total_cost = params[:num_days].to_i * @listing.price
    @booking.cost = total_cost
    @tenant = Tenant.where(user: current_user).first_or_create
    @booking.tenant = @tenant
    
    if @tenant.stripe_customer_id.nil?
      @tenant.stripe_customer_id = Stripe::Customer.create(
        account_balance: total_cost,
        email: @tenant.user.email
      ).id
      customer = Stripe::Customer.retrieve(@tenant.stripe_customer_id)
    else
      customer = Stripe::Customer.retrieve(@tenant.stripe_customer_id)
      customer.account_balance += total_cost
    end
    @tenant.save
    
    if @booking.save
      binding.pry
      customer.save
      redirect_to booking_requests_confirmed_path
    else
      flash[:alert] = 'There was an error in the request'
    end
  end
  
  def confirmed
  end
  
  def show
  end
  
  def index
    if current_user.tenant
      @tenant = current_user.tenant
      @tenant_requests = @tenant.booking_requests
    end
    if current_user.lessor
      @listing = current_user.lessor.home_listing
      @requests = @listing.booking_requests
    end
  end

  def update
    @listing = current_user.lessor.home_listing
    @request = @listing.booking_requests.find(params[:id])
    
    @request.update_attributes(pending: false)
    redirect_to home_listing_booking_requests_path(@listing)
  end
  
  def destroy
    @request = BookingRequest.find(params[:id])
    @listing = @request.home_listing
    
    if @request.destroy
      redirect_to home_listing_booking_requests_path(@listing)
    end
  end
  
  private
  
  def booking_request_params
    params.require(:booking_request).permit(:checkin, :checkout, :party_size)
  end
end
