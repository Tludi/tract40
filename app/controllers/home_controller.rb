class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  
  def index
    @title = "Homespot"
  end
end
