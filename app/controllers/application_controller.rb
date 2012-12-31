class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :authorize
	private
	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
	end

	protected

	def authorize
		puts "Logged in user id : #{session[:user_id]}"
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :notice => "Please log in"
		end
	end

end
