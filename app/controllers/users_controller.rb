class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user

    @activities = Activity.where(owner_id: params[:id])
  end
end
