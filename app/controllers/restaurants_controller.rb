class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :top, :menu ]
  # '/restaurants/top'
  def top
    @restaurants = Restaurant.where(rating: 5)
    # render 'top.html.erb'
  end

  # '/restaurants/ACTUAL_ID/menu'
  def menu
    @restaurant = Restaurant.find(params[:id])
  end

  # CRUD 👇

  # '/restaurants'
  def index
    # @restaurants = Restaurant.all
    @restaurants = policy_scope(Restaurant)
    # render 'index.html.erb'
  end

  # "/restaurants/1"
  def show
    # we get the id from the url and into the params
    @restaurant = Restaurant.find(params[:id])
    # check show? action in the policy of a restaurant
    authorize @restaurant
  end

  # '/restaurants/new'
  def new
    # empty instance JUST for the form builder
    @restaurant = Restaurant.new
    # render 'new.html.erb'
    # who can do this action
    authorize @restaurant
  end

  # Post request -> this has to come from a form
  # NO VIEW
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # redirect_to new_restaurant_path => went to another place and with an empty restaurant
      render :new, status: :unprocessable_entity # stays with the errored restaurant and builds a form with that
    end
  end

  # '/restaurant/1/edit'
  def edit
    # instance JUST for the form builder
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant # this is the record inside the policy
  end

  # Patch request -> this has to come from a form
  # NO VIEW
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # we can't trigger this from a url, we have to click a delete link
  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # Strong params -> whitelisting the attributes a user can give us
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
