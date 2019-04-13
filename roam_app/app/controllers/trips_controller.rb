class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @current_user = current_user
  end

  def create

  end

  def show

  end

  def trip_params
    params.require(:trip).permit(
      :activity_id,
      :user_id,
      :date,
      :time,
      :comments,
      :taken
    )
  end

end
