class UsersController < ApplicationController
    def def new
        @User = User.new
    end
    
    def create
        @User = User.new(params[:user_params])
        if @User.save
          flash[:success] = "User successfully created"
          redirect_to @User
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    def def update
        @User = User.find(params[:id])
        if @User.update_attributes(params[:User])
          flash[:success] = "User was successfully updated"
          redirect_to @User
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
