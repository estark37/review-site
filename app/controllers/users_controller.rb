class UsersController < ApplicationController
  layout :resolve_layout
  before_filter :logged_in_user, :only => [:show]
  before_filter :correct_user, :only => [:update]

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

  def show
    @user = User.find_by_id(params[:id])
    @is_me = (@user.id == current_user.id)
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes params[:user]
      login @user
      render :json => { "success" => true }
    else
      render :json => { "success" => false }
    end
  end

  private

  def resolve_layout
    if action_name == 'show'
      'application'
    else
      'users'
    end
  end
end
