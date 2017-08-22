class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.error.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find_by(params[:id])
  end

  def destroy
    user = User.find_by(params[:id])
    user.destroy
    render json: user
  end

  def update
    user = User.find_by(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.error.full_messages, status: unprocessable_entity
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
