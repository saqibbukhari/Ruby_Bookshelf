class AdminController < ApplicationController
  def index
	@user = User.find_by_id(session[:user_id])
	@user_name = @user.name
	@total_orders = Order.count
  end
end
