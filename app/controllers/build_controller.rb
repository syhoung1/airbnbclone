class BuildController < ApplicationController
  include Wicked::Wizard

  steps :place_type, :bedrooms, :bed_details, :baths, :location, :amenities, :shared_spaces, :photos, :description, :title

  def show
    @home_listing = HomeListing.where(lessor: current_user).first_or_create
    case step
    when :place_type
      @home_listing.build_address
    end
    render_wizard
  end

  def update
    @home_listing = HomeListing.where(lessor: current_user).first_or_create
    case step
    when :place_type
      @home_listing.assign_attributes(place_type_params)
    when :bedrooms
    when :bed_details
    end
    render_wizard @home_listing
  end

  private

  def place_type_params
    params.require(:home_listing).permit(:title, :capacity)
  end
end
