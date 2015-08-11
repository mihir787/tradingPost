class ApplicationController < ActionController::Base
  helper_method :current_user, :incoming_trades
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def incoming_trades
    user_items_ids = current_user.items.ids
    user_items_ids.map { |id| Trade.find_by(item_id: id) }
  end
end
