class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  skip_after_action :verify_authorized
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    @piece = Piece.new
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end

  def invite
    @request = Request.new
    @request.user = User.find(params[:id])
    @request.owner_confirm = true
    @request.created_by = current_user
    @request.role.project = Project.where()


  end

  private

  def pieve_params
    params.require(:piece).permit(:title, :description, :cloudinary_path, :cloudinary_path_cache)
  end

  def user_params
    params.require(:user).permit(:profile_picture, :profile_picture_cache, :bio, :email, :password, :skills, :first_name, :last_name)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
