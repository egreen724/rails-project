class ActivitiesController < ApplicationController

  def new 

  end

  def create 
    
  end

  def show
    
  end

  private
 
  def activity_params
    params.require(:activity).permit(:name, :type, :street_address, :city, :state, :zip_code, :distance, :difficulty_rating, keyword_ids:[], keyword_attributes: [:name])
  end
  
end
