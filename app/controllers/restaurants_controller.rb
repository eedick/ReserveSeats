class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all  
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new 
	end 

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)

		if @restaurant.save
			redirect_to @restaurant, notice: "Restaurant was created successfully!"
		else
			render "new"
		end	
	end

	def update
		@restaurant = Restaurant.find params[:id]
		if @restaurant.update(restaurant_params)
			redirect_to @restaurant, notice: "Restaurant was updated successfully!"
		else 
			render "edit"
		end
	end

	def destroy
		@restaurant = Restaurant.find params[:id]
	  @restaurant.destroy
	  respond_to do |format|
	   format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
	  end
	end


	private
		def restaurant_params
			params.require(:restaurant).permit(:title, :description)
		end
end
