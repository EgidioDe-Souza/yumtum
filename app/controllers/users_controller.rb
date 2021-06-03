class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]

  def account; end

  def edit
    if @user.update(user_params)
      redirect_to account_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :postcode, :chef)
  end
end
