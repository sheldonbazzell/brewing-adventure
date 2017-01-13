class SessionsController < ApplicationController
  def create
  	user = User.find_by(email:params[:post][:email])
  	if user && user.authenticate(params[:post][:password])
  		session[:id] = user.id
  		redirect_to "/"
  	else
  		flash[:login_error] = "Email / password were not a match"
  		redirect_to "/admin"
  	end
  end

  def destroy
		reset_session
		redirect_to "/"
  end
end
