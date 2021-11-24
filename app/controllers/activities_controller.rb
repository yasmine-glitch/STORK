class ActivitiesController < ApplicationController
  def index

    @activities = policy_scope(Activity).order(created_at: :desc)

    ## RETURN THE RESULTS FROM THE HOMEPAGE SEARCH
    # check if the user typed an address in the searchbar
    if params[:query].present?
      # if yes, render all activities located XX km around this address
      @activities = Activity.search_by_place.near(params[:query], 6)
      # @activities = Activity.near(params[:query], 6)
      # return only the activity which are not full
      @activities = @activities.select { |activity| activity.bookings.length <= activity.capacity_max }
      # check if the user enter a date
      if params[:start_date].present?
        # if yes, filter the previous search results by start_date
        @activities = @activities.filter { |activity| activity.start_date >= params[:start_date] }
      end

    # if the user didn't typed an address, check if he typed a date
    elsif params[:start_date].present?
      # if yes, render all activities with the same start date
      @activities = @activities.filter { |activity| activity.start_date >= params[:start_date] }
    # if the user didn't type any place or date

    else
      # render all activities not fully booked
      @activities = @activities.select { |activity| activity.bookings.length <= activity.capacity_max }
      # filter activities with a future start date
      @activities = @activities.filter { |activity| activity.start_date >= DateTime.now }
    end
    ## END OF HOMEPAGE SEARCH'S RESULTS

    # créer une variable avec les coord. GPS de chaque activité
    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity }),
      }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @booking = Booking.new
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    @activity.owner = current_user
    if @activity.save!
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :place, :start_date, :end_date, :capacity_max, :photo)
  end
end
