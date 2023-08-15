class EventsController < ApplicationController
  def index
    @user = LynkUpFacade.new.find_user(params[:user_id])
  end
  
  def show

  end

  def new

  end
end