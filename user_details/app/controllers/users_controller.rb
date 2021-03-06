class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def index
		@users=User.all
	end

	def profile
		@user=User.all
	end

	def create
		@user=User.new(user_params)
		if @user.save
		redirect_to users_list_path
	else
		render 'new'
	end

	end

	def edit
		@user=User.find_by_id(params[:id])
	end

	def update
		@user=User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		redirect_to users_list_path
	end

	def destroy
		@user=User.find_by_id(params[:id])
		@user.destroy
		redirect_to users_list_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password)
	end
end
