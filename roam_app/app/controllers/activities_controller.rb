class ActivitiesController < ApplicationController

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
    @user = current_user
    @creator = User.find_by(id: @activity.creator_id)
  end

  def update
    @activity = Activity.find(params[:id])
    #check if name already exists in the database?
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def index
    @keywords = Keyword.all

    if !params[:category].blank?
      @activities = Activity.category_filter(params[:category])
    elsif !params[:state].blank?
      @activities = Activity.state_filter(params[:state])
    elsif !params[:keyword].blank?
      binding.pry
      @activities = Activity.keyword_filter(params[:keyword])
    elsif !params[:distance].blank?
      if params[:distance] == "Greater than 10 miles"
        @activities = Activity.greater_than_ten
      elsif params[:distance] == "5-9.9 miles"
        @activities = Activity.five_to_ten
      elsif params[:distance] == "2-4.9 miles"
        @activities = Activity.two_to_five
      else
        @activities = Activity.less_than_two
      end
    else
      @activities = Activity.all
    end
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
