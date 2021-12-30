class RestaurantsController < ApplicationController

    before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
    before_action :get_average_ratings, only: [:index, :top]

  def home
  end

  def top
  end

  def index
  end

  def show
    @average_rating = []
    @restaurant.reviews.each do |review| 
      @average_rating << review.rating
    end
    @average_rating = @average_rating.sum / (@average_rating.length == 0 ? 1 :  @average_rating.length)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    
  end

#   def edit
#   end

#   def update
#     @restaurant = Restaurant.update(restaurant_params)
#   end

#   def destroy
#     @restaurant.destroy
#   end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def get_average_ratings
    @restaurants = Restaurant.all
    @average_rating = Review.where(restaurant_id: @restaurants)
    .group(:restaurant_id)
    .average(:rating)
    .transform_values { |rating| rating.round(2) }
  end

end
