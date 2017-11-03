class UsersController < ApplicationController

	def index

		@user = User.all

	end

	def new

		@user = User.new

	end

	def create

		@user = User.create(user_params)

		session[:current_user_id] = @user.id

		redirect_to user_path(@user.id)

	end

	def show

		@user = User.find(params[:id])

		@created_events = Created_events.all

		@participated_events = Participated_events.all

	end

	def edit

		@user = User.find(params[:id])

	end

	def update

		@user = User.find(params[:id])

		@user.update(user_params)

		redirect_to show_user_path

	end

	def destroy

		@user = User.find(params[:id])

		@user.destroy

		redirect_to users_path

	end

	private

	def user_params

		params.require(:user).permit(:name)

	end

end
