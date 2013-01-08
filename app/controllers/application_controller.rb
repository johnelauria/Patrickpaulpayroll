class ApplicationController < ActionController::Base
  require 'rhoconnect-rb'
  protect_from_forgery
  
  include SessionsHelper
  include EmployeesHelper

  before_filter :time_zone

  def time_zone
  	Time.zone = 'Beijing'
  end
end
