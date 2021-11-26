class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @user = current_user
    @booking.user = @user
    @activity = Activity.find(params[:activity_id])
    @booking.activity = @activity
    authorize @activity
    if @booking.save
      redirect_to dashboard_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.find(params[:id])
    @user = current_user
    authorize @booking
    @booking.user = @user
    @booking.destroy
    # @booking.status = "Cancelled"
    if params[:from] == "dashboard"
      redirect_to dashboard_path
    else
      redirect_to activity_path(@activity)
    end
  end
end
