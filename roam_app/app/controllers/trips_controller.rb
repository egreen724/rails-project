class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @current_user = current_user
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to ("/trips/#{@trip.id}") #add nested routes

  end

  def show
    @trip = Trip.find(params[:id])
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
