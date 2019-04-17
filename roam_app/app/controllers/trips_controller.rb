class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @current_user = current_user
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to ("/trips/#{@trip.id}") #add nested routes

  end

  def index
    if params[:user_id]
      @trips = User.find_by(id: params[:user_id]).trips
    else
      @trips = Trip.all
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    @current_user = current_user
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to ("/trips/#{@trip.id}")
  end

  def trip_params
    params.require(:trip).permit(
      :activity_id,
      :user_id,
      :date,
      :time_ellapsed,
      :comment,
      :taken
    )
  end

end
