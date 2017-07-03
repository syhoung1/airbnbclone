class BookingRequestsController < ApplicationController
  def create
    @listing = HomeListing.find(params[:home_listing_id])
    @booking = @listing.booking_requests.new(booking_request_params)
    @tenant = Tenant.where(user: current_user).first_or_create
    @booking.tenant = @tenant
    
    if @booking.save
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
    @listing = current_user.lessor.home_listing
    @requests = @listing.booking_requests
  end

  
  
  private
  
  def booking_request_params
    params.require(:booking_request).permit(:checkin, :checkout, :party_size)
  end
end
