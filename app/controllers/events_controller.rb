class EventsController < ApplicationController
  def index
    @user = LynkUpFacade.new.find_user(params[:user_id])
    @my_events_sorted = LynkUpFacade.new.sort_events(@user.my_events)
    @invited_events_sorted = LynkUpFacade.new.sort_events(@user.invited_to_events)

    @my_upcoming_events = LynkUpFacade.new.upcoming_events(@my_events_sorted)
    @my_past_events = LynkUpFacade.new.past_events(@my_events_sorted)

    @invited_upcoming_events = LynkUpFacade.new.upcoming_events(@invited_events_sorted)
    @invited_past_events = LynkUpFacade.new.past_events(@invited_events_sorted)
  end
  
  def show

  end

  def new

  end
end