class UsersController < ApplicationController
  def dashboard
    @user = LynkUpFacade.new.find_user(params[:user_id])
    all_events = LynkUpFacade.new.combine_events(@user.my_events, @user.invited_to_events)
    @upcoming_events = LynkUpFacade.new.upcoming_events(all_events)
    @past_events = LynkUpFacade.new.past_events(all_events)
  end
end