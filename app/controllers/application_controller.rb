class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= LynkUpFacade.new.find_user(params[:user_id])
  end
end
