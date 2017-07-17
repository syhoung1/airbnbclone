class ReviewsController < ApplicationController
  def new
    @listing = HomeListing.find(params[:home_listing_id])
    if current_user.tenant.nil?
      Tenant.create(user: current_user)
    end
    @tenant = current_user.tenant
    
    @review = @listing.reviews.create(tenant: @tenant)
  end
  
  def update
    @listing = HomeListing.find(params[:home_listing_id])
    @tenant = current_user.tenant
    
    @review = Review.create(home_listing: @listing, tenant: @tenant)
    binding.pry
    @review.update_attributes(description: params[:review][:description])
    
    if @review.save
      redirect_to @listing
    else
      render :new
    end
  end
  
  def destroy
    @listing = HomeListing.find(params[:home_listing_id])
    @review = @listing.reviews.find(params[:id])
    
    if @review.destroy
      redirect_to @listing
    end
  end
end
