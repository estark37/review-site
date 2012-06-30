module SessionsHelper

  def login(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_user?(user)
    @current_user == user
  end

  def loggedin?
    !self.current_user.nil?
  end

  def logout
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def logged_in_user
    unless loggedin?
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    unless loggedin? && current_user?(@user)
      redirect_to root_path
    end
  end

end
