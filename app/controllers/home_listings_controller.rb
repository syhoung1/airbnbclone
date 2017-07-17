class HomeListingsController < ApplicationController
  before_action :set_page, only: [:index]
  
  def create
    
  end
  
  def index
    @listings = HomeListing.order(created_at: :desc).limit(40).offset(@page * 10)
    @longitude = Address.select('longitude').to_json.html_safe
    @latitude = Address.select('latitude').to_json.html_safe
  end

  def show
    @listing = HomeListing.find(params[:id])
    @booking = @listing.booking_requests.new
    @reviews = @listing.reviews
  end

  def edit
    @home_listing = current_user.lessor.home_listing
  end
  
  def update
    @home_listing = current_user.lessor.home_listing
    @home_listing.update_attributes(home_params)
    
    if @home_listing.save
      render :edit
    else
      render :edit
    end
  end
  
  def destroy
    @home_listing = current_user.lessor.home_listing
    
    if @home_listing.destroy 
      redirect_to home_listings_path
    else
      render edit
    end
  end
  
  private
  
  def set_page
    @page = params[:page] || 0
  end
  
  def home_params
    params.require(:home_listing).permit!
  end
end
