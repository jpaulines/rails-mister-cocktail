class ReviewsController < ApplicationController
  def new
    # nothing
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save
    redirect_to cocktail_path(@review.cocktail)
    # else
    #   render :template => 'cocktails/show'
    # end
  end

  def destroy
    @review = Review.find(params[:id])
    @cocktail = @review.cocktail
    @review.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
