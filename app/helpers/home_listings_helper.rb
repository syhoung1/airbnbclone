module HomeListingsHelper
  @listings = HomeListing.all
  
  puts @listings.length
  list_start = 0
  if @listings.length > 18
    list_lgth = 18
  else
    list_lgth = @listings.length
  end
end
