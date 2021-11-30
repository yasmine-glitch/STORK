class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all.select do |activity|
      activity.bookings.count > 35
    end
    # @activities = Activity.where("bookings.length > 0")
  end

  def dashboard
    @user = current_user
  end

  def test
    @activity = Activity.find(146)

    @booking = Booking.new
    @booking_exist = Booking.find_by(activity_id: params[:id], user_id: current_user)
    @all_participants = [@activity.owner, @activity.users].flatten
  end
end
