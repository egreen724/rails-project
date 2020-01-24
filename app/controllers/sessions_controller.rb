class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create, :googleAuth]

  def new

  end

  def create
   @user = User.find_by(email: params[:user][:email])

   if User.find_by(email: params[:user][:email]) == nil
     flash[:notice] = "Please enter a valid password or Sign Up to create an account."
     redirect_to(controller: 'sessions', action: 'new')
   else
     if @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to ("/users/#{@user.id}")
    end
   end
 end

   def destroy
     session.delete :user_id
     redirect_to root_path
   end

   def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    @user = User.from_omniauth(access_token)
    session[:user_id] = @user.id
    #log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    @user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    @user.google_refresh_token = refresh_token if refresh_token.present?
    @user.save
    redirect_to ("/users/#{@user.id}")
  end
end
