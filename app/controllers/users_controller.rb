class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json:user, status: :created
    else 
      render json:user.errors, status: :unprocessable_entity
    end
  end

  def index
    render json:User.all
  end
  
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end



end
