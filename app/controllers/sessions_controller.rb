class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
    	if user.save
    	  session[:user_id] = user.id
    	end
	end

	def destroy
		@user = User.find(params[:id])
    	if @user
      	   @user.destroy
    	else
      	   render '404'
    	end
  	end

  	private

  	def user_params
    	params.require(:user).permit(:username, :email, :password)
  	end

end

end
