class HomeListingsController < ApplicationController
  def index
    @listings = HomeListing.all
    @longitude = Address.select('longitude').to_json.html_safe
    @latitude = Address.select('latitude').to_json.html_safe

  end

  def show
    @listing = HomeListing.find(params[:id])
  end

  def edit
  end
end
