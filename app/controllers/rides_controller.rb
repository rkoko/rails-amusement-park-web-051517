class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    @message = @ride.take_ride
    flash[:notice] = @message
    if @message = "Thanks for riding #{@ride.attraction.name}"
      @ride.save
      redirect_to user_path(@ride.user_id)
    else
      redirect_to user_path(@ride.user_id)
    end


  end







end
