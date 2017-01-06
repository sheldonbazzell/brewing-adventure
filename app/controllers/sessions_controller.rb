class SessionsController < ApplicationController
  def create
  	user = User.find_by(email:params[:user][:email])
  	if user && user.authenticate(params[:user][:password])
  		session[:id] = user.id
  		redirect_to "/"
  	else
  		flash[:login_error] = "Email / password were not a match"
  		redirect_to "/sessions/new"
  	end
  end

  def destroy
		reset_session
		redirect_to "/"
  end
end
