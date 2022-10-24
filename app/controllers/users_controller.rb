class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    puts params
    @user_by_id = User.find_by(id: params['id'])
  end
end
