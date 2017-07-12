class BuildController < ApplicationController
  include Wicked::Wizard
  
  
  steps :place_type, :place_type2, :bedrooms, :baths, :location, :amenities, :shared_spaces, :photos, :description, :title, :pricing
  
  def edit
    @home_listing = HomeListing.where(user: current_user)
  end
  
  def create
    lessor = Lessor.create(user: current_user)
    @home_listing = HomeListing.create(lessor: lessor)
    redirect_to wizard_path(steps.first)
  end
  
  def show
    lessor = Lessor.where(user: current_user).first_or_create
    @home_listing = HomeListing.where(lessor: lessor).first_or_create
    @address = Address.where(home_listing: @home_listing).first_or_create
    render_wizard
  end
  
  def update
    @home_listing = HomeListing.where(lessor: current_user.lessor).first
    # @address = @home_listing.address
    
    case step
    when :place_type
      @home_listing.update_attributes(place_params)
    when :place_type2
      @home_listing.update_attributes(place_params2)
    when :bedrooms
      @home_listing.update_attributes(bedroom_params)
    when :baths
      @home_listing.update_attributes(bath_details)
    when :location
      @home_listing.address.update_attributes(location_params)
    when :amenities
      @home_listing.update_attributes(amenities_params)
    when :shared_spaces
      @home_listing.update_attributes(shared_spaces_params)
    when :photos
      @home_listing.update_attributes(photos_params)
    when :description
      @home_listing.update_attributes(description_params)
    when :title
      @home_listing.update_attributes(title_params)
    when :pricing
      @home_listing.update_attributes(price_params)
    end
    render_wizard @home_listing
  end
  
  private
  
  def place_params
    params.require(:home_listing).permit(:place_type)
  end
  
  def place_params2
    params.require(:home_listing).permit(:place, :property_type, :accommodation_situation)
  end
  
  def bedroom_params
    params.require(:home_listing).permit(:capacity, :bedrooms, :beds)
  end
  
  def bath_details
    params.require(:home_listing).permit(:bathrooms)
  end
  
  def location_params
    params.require(:address).permit(:country, :address, :city, :state, :zip_code)
  end
  
  def amenities_params
    params.require(:home_listing).permit(:amenities => [])
  end
  
  def shared_spaces_params
    params.require(:home_listing).permit(:shared_spaces => [])
  end
  
  def photos_params
    params.require(:home_listing).permit(:photos)
  end
  
  def description_params
    params.require(:home_listing).permit(:summary, :good_for)
  end
  
  def title_params
    params.require(:home_listing).permit(:title)
  end
  
  def price_params
    params.require(:home_listing).permit(:price)
  end
end
