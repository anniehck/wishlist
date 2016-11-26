class UsersController < ApplicationController
  before_action :authorize_user, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !@user == current_user
      flash[:alert] = 'You do not have access to this page.'
      redirect_to root_path
    end
  end
end
