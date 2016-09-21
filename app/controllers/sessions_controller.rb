class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(login_email)
    if @user && @user.authenticate(login_password[:password])
    	  session[:user_id] = @user.id

        render json: { session_id: session[:user_id], current_user: current_user }
    	end
	end

	def destroy
		session.clear

    render json: { session_id: false, current_user: false }
	end

	private

	def login_email
    params.require(:login).permit(:email)
  end

  def login_password
    params.require(:login).permit(:password)
  end

end
