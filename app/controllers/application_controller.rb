class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  before_filter do 
    @site = Site.first
  end

  # def after_sign_in_path_for(resource)
  #   root_path
  # end
end
