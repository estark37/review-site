class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      render :json => { "success" => true, "redirect" => root_path }
    else
      flash.now[:badlogin] = true
      render 'new'
    end
  end

  def destroy
    logout
    render :json => { "success" => true, "redirect" => root_path }
  end

end
