class UsersController < ApplicationController

	def index
		@users = User.all
	end
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user, notice: 'User Saved'
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :username, :password, :password_confirmation, :bio)
	end
end
