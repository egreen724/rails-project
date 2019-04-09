class UsersController < ApplicationController

  def new

  end

  def create
    user = User.new(user_params)

    if user.valid? && params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to ("/users/#{@user.id}")
    else
      flash[:notice] = "Please complete the form with valid entries."
      redirect_to(controller: 'users', action: 'new')
    end
  end

  def show
    @user = User.find(params[:id])
    
  end

  def update

  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :bio, :ago, :password, :password_confirmation)
   end
end
