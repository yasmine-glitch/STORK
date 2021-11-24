class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @activities = Activity.where("bookings.length > 0")
    @activities = Activity.joins(:bookings).group("activities.id").having("count(activity_id)>0")
  end

  def dashboard
  end
end
