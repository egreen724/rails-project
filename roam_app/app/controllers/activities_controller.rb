class ActivitiesController < ApplicationController

  def new
    @user = current_user
    @activity = Activity.new
  end

  def create

    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to ("/activities/#{@activity.id}")
    elsif Activity.find_by(name: params[:activity][:name])
      flash[:notice] = "This activity already exists in the Roam system."
    else
      flash[:notice] = "Please complete the form with valid entries."
      redirect_to(controller: 'activities', action: 'new')
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @creator = User.find_by(id: @activity.creator_id)
    @current_user = current_user
  end

  def edit
    @activity = Activity.find(params[:id])
    @user = current_user
    @creator = User.find_by(id: @activity.creator_id)
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      flash[:notice] = "Please complete the form with valid entries."
      redirect_to(controller: 'activities', action: 'edit')
    end
  end

  def index
    @keywords = Keyword.all
    @activities = Activity.filtered_activities(params)

  end


  def activity_params
    params.require(:activity).permit(
      :name,
      :category,
      :distance,
      :street_address,
      :city,
      :state,
      :zip_code,
      :parking,
      :creator_id,
      :difficulty_rating,
      keyword_ids:[],
      keywords_attributes: [:name]
    )
  end

end
