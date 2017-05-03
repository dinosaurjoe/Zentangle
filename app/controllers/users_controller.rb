class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end

  def invite
    @request = Request.new
    @request.user = params[:user_id]
    @request.owner_confirm = true
    @request.created_by = current_user
  end

  private

  def user_params
    params.require(:user).permit(:bio, :email, :password, :skills, :first_name, :last_name)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
