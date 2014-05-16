module ApplicationHelper

  def current_user
 	#Or or method equal (Memoization) - sets this thing ONCE and don't reset. Current user - if current user is already set(or evaluates to truthy), don't do anything, just leave the value as it is
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end

  def authenticate_user
    if !current_user
      redirect_to new_sessions_path
    end
  end

end
