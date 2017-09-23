class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
    @event
  end

  def index
    @user = current_user
    @categories = current_user.categories
    @events = current_user.events
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to dashboard_path
      flash[:notice] = "Event was created successfully."
    else
      flash.now[:error] = "Couldn't create event."
      render :new
    end
  end

  def edit
    @event
  end

  def update
    if @event.update(event_params)
      redirect_to dashboard_path
      flash[:notice] = "Event was updated successfully."
    else
      flash.now[:error] = "Couldn't update event."
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to dashboard_path
    flash[:notice] = "Event was successfully destroyed."
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :id,
      :title,
      :description,
      :start_time,
      :end_time,
      :event_file,
      :active,
      :private,
      :category_id
    )
  end
end