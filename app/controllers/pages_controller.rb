class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @activities = Activity.all.select do |activity|
      activity.bookings.count > 0
    end
    # @activities = Activity.where("bookings.length > 0")
  end

  def dashboard
  end
end
