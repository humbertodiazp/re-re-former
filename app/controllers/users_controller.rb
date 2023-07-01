class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params[:user_params])
        if @user.save
          flash[:success] = "user successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    def def update
        @user = user.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:success] = "user was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end
