class ApplicationController < ActionController::Base
  protect_from_forgery

  def order_column
    session[:order_by] || :position
  end

end
