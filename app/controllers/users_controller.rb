class UsersController < ApplicationController
    def def new
        @User = User.new
    end
    
    def def create
        @User = User.new(params[:user_params])
        if @User.save
          flash[:success] = "Object successfully created"
          redirect_to @User
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end
