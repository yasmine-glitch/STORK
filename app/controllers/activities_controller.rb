class ActivitiesController < ApplicationController
  def index
    @activity = Activity.all
  end

  def show
    @activity = activity.find(params[:id])
    @user = current_user
    @booking.user = @user
    @users = User.all
    @users.activity = @users
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
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :place, :address, :start_date, :end_date, :capacity_max, :is_full, :owner_id, :photo)
  end
end
