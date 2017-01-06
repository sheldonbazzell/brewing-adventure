class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.new( user_params )
  	unless user.valid?
  		flash[:reg_errors] = user.errors.full_messages.to_sentence
  		redirect_to "/users/new"
  	else
      user.save!
  		session[:id] = user.id
  		redirect_to "/"
  	end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
