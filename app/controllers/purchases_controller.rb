class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def show;
  end

  def create
    @meal = Meal.find(params[:id])
    @buyer = current_user

    @purchase = Purchase.new(purchase_params)
    @purchase.meal = @meal
    @purchase.buyer = @buyer
    @purchase.save
    redirect_to purchases_path
  end


  def destroy
    purchase = Purchase.find(params[:id])
    purchase.destroy
    redirect_to purchases_path
  end

  def purchase_params
    params.require(:purchase).permit(:quantity)
  end

end
