class BuildController < ApplicationController
  include Wicked::Wizard
  
  steps :place_type, :bedrooms, :bed_details, :baths, :location, :amenities, :shared_spaces, :photos, :description, :title
  
  def create
    @home_listing = HomeListing.create(lessor: current_user)
    redirect_to wizard_path(steps.first)
  end
end
