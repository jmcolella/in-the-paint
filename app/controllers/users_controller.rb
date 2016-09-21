class UsersController < ApplicationController


  def create
    @user = User.new(user_params)
    binding.pry
      if @user.save
        session[:user_id] = @user.id

        render json: { session_id: session[:user_id], current_user: current_user }
      end
  end

	def show
		@user = User.find(params[:id])
	end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
