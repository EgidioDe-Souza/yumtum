class MealsController < ApplicationController
  before_action :set_meal, only: [:show]

  def index
    if params[:postcode] == ''
      @meals = Meal.all
    else
      @postcode = params[:postcode].split.first
      @meals = Meal.search_by_chef_location(@postcode)
    end
  end

  def show; end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @chef = current_user
    @meal.chef = @chef
    if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, :price)
  end
end
