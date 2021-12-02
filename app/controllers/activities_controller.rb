class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Activity).order(start_date: :asc)
    @user_hobbies = current_user.hobby_list
    params[:categories] ||= []

    ## RETURN THE RESULTS FROM THE HOMEPAGE SEARCH

    # check if the user typed an address in the searchbar
    if params[:query].present?
      # if yes, render all activities located XX km around this address
      @activities = @activities.search_by_place(params[:query]).near(params[:query], 100)
      # return only the activity which are not full
      @activities = @activities.select { |activity| activity.bookings.length < activity.capacity_max }
      # filter the activities depending on the hobbies of the user || the filters he clicks on the index
      filter_activities
      # check if the user enter a date
      if params[:start_date].present?
        # if yes, filter the previous search results by start_date
        @activities = @activities.filter { |activity| activity.start_date.to_date >= params[:start_date].to_date }
        # if there is no activity on the selected date
        if @activities.empty?
          # inform the user and advise him to take a look to other activities
          @title = "We didn't find any activity for #{params[:start_date]} ... but look at the coming events in #{params[:query]}!"
          @activities = policy_scope(Activity).order(start_date: :asc).search_by_place(params[:query]).near(params[:query], 100)
          # filter the activities depending on the hobbies of the user || the filters he clicks on the index
          filter_activities
          # return only the activity which are not full
          @activities = @activities.select { |activity| activity.bookings.length < activity.capacity_max }
          # filter the previous search results by start_date
          @activities = @activities.filter { |activity| activity.start_date.to_date > params[:start_date].to_date }
        else
          # write a sentence for the user
          @title = "We found #{helpers.pluralize(@activities.count, 'activity')} near #{params[:query]}"
        end
      end

      # if the user didn't typed an address, check if he typed a date
    elsif params[:start_date].present?
      # if yes, render all activities with the same start date
      @activities = @activities.filter { |activity| activity.start_date.to_date >= params[:start_date].to_date }
      # filter activities
      filter_activities
      # if there is no activity at that date
      if @activities.empty?
        # inform the user and advise him to take a look to other activities
        @title = "We didn't find any activity for #{params[:start_date]} ... but look at the coming events!"
        @activities = policy_scope(Activity).order(start_date: :asc)
        @activities = @activities.filter { |activity| activity.start_date.to_date >= params[:start_date].to_date }
      else
        @title = "We found #{helpers.pluralize(@activities.count, 'activity')} in the world"
      end

      # if the user didn't type any place or date
    else
      # render all activities not fully booked
      @activities = @activities.select { |activity| activity.bookings.length < activity.capacity_max }
      # filter activities with a future start date
      @activities = @activities.filter { |activity| activity.start_date.to_date >= DateTime.now }
      # filter activities
      filter_activities
      # if there is no activity today
      if @activities.empty?
        # inform the user and advise him to take a look to other activities
        @title = "We didn't find any activity for #{params[:start_date]} but look at the coming events!"
        @activities = policy_scope(Activity).order(start_date: :asc)
        if params[:start_date]
          @activities = @activities.filter { |activity| activity.start_date.to_date > DateTime.now }
        end

      else
        @title = "We found #{helpers.pluralize(@activities.count, 'activity')} today in the world"
      end
    end
    ## END OF HOMEPAGE SEARCH'S RESULTS

    # GET ALL ACTIVITIES GPS COORD;

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        id: activity.id,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity })
      }
    end 
  end


  def show
    @activity = Activity.find(params[:id])
    @activities = Activity.where(owner_id: @activity.owner_id)
    authorize @activity
    @booking = Booking.new
    @booking_exist = Booking.find_by(activity_id: params[:id], user_id: current_user)
    @all_participants = [@activity.owner, @activity.users].flatten

    @markers = [
      {
        lat: @activity.latitude,
        lng: @activity.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: @activity }),
        } ]
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    @activity.owner = current_user
    if @activity.save!
      redirect_to activity_path(@activity)
      Chatroom.create(activity: @activity, name: "#{@activity.name} chat")
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :place, :start_date, :end_date, :capacity_max, :photo)
  end

  def filter_activities
    @activities = @activities.select do |activity|
      filter_tags = params[:categories].present? ? params[:categories] : @user_hobbies
      filter_tags.include?(activity.category)
    end
  end
end
