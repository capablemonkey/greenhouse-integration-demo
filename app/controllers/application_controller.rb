class ApplicationController < ActionController::Base
  protect_from_forgery

  def option1
  	render "option1.erb"
  end
end
