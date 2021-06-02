class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @purchase = Purchase.new(@meal)
    @buyer = current_user
    @chef = meal
    @purchase.buyer = @buyer
    @purchase.chef = @chef
    if @purchase.save
      redirect_to purchases_path
    else
      render :new
    end
  end

end
