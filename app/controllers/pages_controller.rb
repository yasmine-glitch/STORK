class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all.select do |activity|
      activity.bookings.count > 25
    end
    # @activities = Activity.where("bookings.length > 0")
  end

  def dashboard
    @user = current_user
    @owneractivities = Activity.where(owner: current_user)
  end

  def test
    @activity = Activity.find(146)
    @activities = Activity.where(owner_id: @activity.owner_id)
    @booking = Booking.new
    @booking_exist = Booking.find_by(activity_id: 146, user_id: current_user)
    @all_participants = [@activity.owner, @activity.users].flatten
  end
end
