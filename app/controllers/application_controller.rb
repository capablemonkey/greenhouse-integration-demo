require 'pp'

JOB_BOARD_NAME = "vaulttec"

class ApplicationController < ActionController::Base
  protect_from_forgery

  def option1
  	render "option1.erb"
  end

  def option2
  	render "option2.erb"
  end

  def option3
  	@offices = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/#{JOB_BOARD_NAME}/embed/offices")["offices"]
  	render "option3.erb"
  end

  def option4
  	@offices = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/#{JOB_BOARD_NAME}/embed/offices")["offices"]
  	render "option4.erb"
  end
end
