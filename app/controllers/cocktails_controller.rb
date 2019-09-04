class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    # find_cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
  def find_cocktail
    @cocktail = Cocktail.find(param[:id])
  end
end
