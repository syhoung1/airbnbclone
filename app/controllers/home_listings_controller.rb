class HomeListingsController < ApplicationController
  before_action :set_page, only: [:index]
  
  def index
    @listings = HomeListing.order(created_at: :desc).limit(18).offset(@page * 10)
    @longitude = Address.select('longitude').to_json.html_safe
    @latitude = Address.select('latitude').to_json.html_safe

  end

  def show
    @listing = HomeListing.find(params[:id])
  end

  def edit
  end
  
  private
  
  def set_page
    @page = params[:page] || 0
  end
end
