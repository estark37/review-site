class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login @user
      render :json => { "success" => true, "redirect" => root_path }
    else
      render 'new'
    end
  end
end
