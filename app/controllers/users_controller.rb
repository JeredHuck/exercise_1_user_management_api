class UsersController < ApplicationController
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:full_name, :email, :age)
    end
  end
  
end
