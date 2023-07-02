class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render :new, status: :unprocessable_entity
      end
    end


    def update
        @user = user.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:success] = "user was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
