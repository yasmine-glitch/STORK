class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    # PUNDIT @activites = policy_scope(Activity).order(created_at: :desc)

    ## RETURN THE RESULTS FROM THE HOMEPAGE SEARCH
    # check if the user typed an address in the searchbar
    if params[:query].present?
      # if yes, render all activities located XX km around this address
      @activities = @activity.search_by_place(params[:query])
      # return only the activity which are not full
      @activities = @activities.select { |activity| activity.bookings.length <= activity.capacity_max }
      # check if the user enter a date
      if params[:start_date].present?
        # if yes, filter the previous search results by start_date
        @activities = @activity.filter { |activity| activity.start_date == params[:start_date] }
      end

    # if the user didn't typed an address, check if he typed a date
    elsif params[:start_date].present?
      # if yes, render all activities with the same start date
      @activities = @activity.filter { |activity| activity.start_date == params[:start_date] }
    # if the user didn't type any place or date

    else
      # render all activities not fully booked
      @activities = @activity.select { |activity| activity.bookings.length <= activity.capacity_max }
      # filter activities with a future start date
      @activities = @activity.filter { |activity| activity.start_date >= Date.now }
    end
    ## END OF HOMEPAGE SEARCH'S RESULTS
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :place, :start_date, :end_date, :capacity_max)
  end
end
