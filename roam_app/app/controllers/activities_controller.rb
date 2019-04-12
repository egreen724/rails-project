class ActivitiesController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:index, :show]

  def new

  end

  def create

    activity = Activity.new(activity_params)

    if Activity.find_by(name: params[:activity][:name])
      flash[:notice] = "This activity already exists in the Roam system."
    elsif
      activity.valid?
        @activity = Activity.create(activity_params)
        redirect_to ("/activities/#{@activity.id}")
    else
      flash[:notice] = "Please complete the form with valid entries."
      redirect_to(controller: 'activity', action: 'new')
    end
  end

  def show
    @activity = Activity.find(params[:id])

  end

  def edit
    @activity = Activity.find(params[:id])

    creator = User.find_by(id: @activity.creator_id)

    unless current_user.id == creator.id
      flash[:message]= "Only the creator of this activity can make changes."
    end
  end

  def update
    @activity = Activity.find(params[:id])
    #check if name already exists in the database?
    @activity.update(
      name: params[:name],
      category: params[:category],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      distance: params[:distance],
      difficulty_rating: params[:difficulty_rating],
      keyword_ids:[], #check this
      keyword_attributes: [:name] #check this
      )
    redirect_to activity_path(@activity)
  end

  def index
    @activities = Activity.all
  end

  def activity_params
    params.require(:activity).permit(:name, :category, :distance, :street_address, :city, :state, :zip_code, :difficulty_rating, keyword_ids:[], keyword_attributes: [:name])
  end

end
