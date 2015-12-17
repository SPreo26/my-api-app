class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use  instead :null_session
  protect_from_forgery with: :null_session
  #:exception
end
