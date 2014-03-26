class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  private

    def current_foster
      Foster.find(session[:foster_id])
    rescue ActiveRecord::RecordNotFound
      foster = Foster.create
      session[:foster_id] = foster.id
      foster
    end
end

