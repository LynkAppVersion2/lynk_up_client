class UsersController < ApplicationController
  def dashboard
    @user = LynkUpFacade.new.find_user(params[:user_id])
  end
end