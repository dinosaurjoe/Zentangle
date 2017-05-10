class PiecesController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_user, only: [:new, :show, :update, :destroy]
  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    @piece.update(piece_params)
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @user.pieces.new
  end

  def create
    @piece = Piece.new(piece_params)

    if @piece.save
      redirect_to user_edit_path(current_user)
    else
      redirect_to new_piece_path(current_user.pieces.new)
    end

  end

  def destroy
    @piece.destroy
    respond_to do |format|
      format.js do
      end
      format.html do
      end
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :description, :cloudinary_path)

  end

end
