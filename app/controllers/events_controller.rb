class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @events = current_user.events
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to dashboard_path
    else
      flash.now[:error] = "Couldn't create event."
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :id,
      :title,
      :description,
      :start_time,
      :end_time,
      :active,
      :private
    )
  end
end