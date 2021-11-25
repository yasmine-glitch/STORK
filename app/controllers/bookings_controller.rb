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
end
