class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @booking = Booking.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    if @activity.save!
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :place, :place, :start_date, :end_date, :capacity_max, :photo)
  end
end
