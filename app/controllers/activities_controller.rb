class ActivitiesController < ApplicationController

  def index
    @activity = Activity.all
  end

  def show
    @activity = activity.find(params[:id])
    @user = current_user
    @booking = Booking.new
  end
end
