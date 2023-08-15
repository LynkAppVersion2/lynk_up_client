class UsersController < ApplicationController
  def dashboard
    @user = LynkUpFacade.new.find_user(params[:id])
  end
end