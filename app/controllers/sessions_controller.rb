class SessionsController < ApplicationController
  
  def create
    #render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      # Create aan error message
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def new
    
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
