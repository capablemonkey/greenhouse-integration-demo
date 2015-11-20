require 'pp'
require 'base64'

# replace with your own board name and API key
# (this API key is invalid)
JOB_BOARD_NAME = "vaulttec"
JOB_BOARD_API_KEY = "672a225ee0909c53a39d842b9d5566a0"

class ApplicationController < ActionController::Base
  protect_from_forgery

  def option1
    render "option1"
  end

  def option2
    render "option2"
  end

  def option3
  	@offices = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/#{JOB_BOARD_NAME}/embed/offices")["offices"]
  	render "option3"
  end

  def option4
  	@offices = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/#{JOB_BOARD_NAME}/embed/offices")["offices"]
  	render "option4"
  end

  def option4_get_job
    @job_id = params[:jobId]
    render "option4_get_job"
  end

  def option5
    @offices = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/#{JOB_BOARD_NAME}/embed/offices")["offices"]
    render "option5"
  end

  def option5_show_by_department

  end

  def option5_get_job
    job_id = params[:jobId]
    # note the querystring param &questions=true
    @job = (JSON.parse RestClient.get "https://api.greenhouse.io/v1/boards/vaulttec/embed/job?id=#{job_id}&questions=true")
    pp @job
    render "option5_get_job"
  end

  def option5_post_job_application
    @job_id = params[:jobId]

    request_body = params.except(:action, :controller)
    request_body['id'] = @job_id
    encoded_api_key = Base64.encode64(JOB_BOARD_API_KEY)

    @error = nil
    @success = false

    begin
      response = RestClient.post('https://api.greenhouse.io/v1/applications/',
        request_body,
        { :Authorization => "Basic #{encoded_api_key}" }
      )

      @success = response.code == 200 ? true : false
    rescue => e
      @error = JSON.parse e.response
    end

    render "option5_post_job_application"
  end
end