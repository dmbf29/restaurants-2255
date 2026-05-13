class ReviewsController < ApplicationController
  # '/restaurants/SOME_RESTAURANT_ID/reviews/new'
  def new
    # needed instance for the form builder
    @review = Review.new
    # we need to add the restaurant in the form's URL
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # THIS HAS TO COME FROM A FORM
  # POST -> '/restaurants/SOME_RESTAURANT_ID/reviews'
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
