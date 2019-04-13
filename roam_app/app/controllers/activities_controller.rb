class ActivitiesController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:index, :show]

  def new
    @user = current_user
    @activity = Activity.new
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
    @creator = User.find_by(id: @activity.creator_id)
  end

  def update
    @activity = Activity.find(params[:id])
    #check if name already exists in the database?
    @activity.update(
      name: params[:activity][:name],
      category: params[:activity][:category],
      street_address: params[:activity][:street_address],
      city: params[:activity][:city],
      state: params[:activity][:state],
      zip_code: params[:activity][:zip_code],
      distance: params[:activity][:distance],
      difficulty_rating: params[:activity][:difficulty_rating] #check this
      )
    redirect_to activity_path(@activity)
  end

  def index
    @activities = Activity.all
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
