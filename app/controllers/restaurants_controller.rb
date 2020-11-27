class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new # Ao mostrar os dados do restaurante, 
                         # já cria o objeto review.
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Dados que podem ser alterados
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end

end
