module ApplicationHelper

  def current_user

 	#Or or method equal (Memoization) - sets this thing ONCE and don't reset. Current user - if current user is already set(or evaluates to truthy), don't do anything, just leave the value as it is
   if session[:remember_token]
   	@current_user ||= User.find(session[:remember_token])
   else
	@current_user = nil
   end
   end
end
