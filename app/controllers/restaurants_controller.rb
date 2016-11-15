class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all  
	end

	def new
		@restaurant = Restaurant.new 
	end 

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)

		@restaurant.save
		if @restaurant.save
			redirect_to @restaurant
		else
			render "new"
		end	
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	private
		def restaurant_params
			params.require(:restaurant).permit(:title, :description)
		end
end