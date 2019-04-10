class UsersController < ApplicationController

  def home

  end

  def new

  end

  def create
    user = User.new(user_params)

    if User.find_by(email: params[:user][:email])
      flash[:notice] = "This email address is already in the Roam system. Please log in."
    elsif
      user.valid? && params[:user][:password] == params[:user][:password_confirmation]
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update (name: params[:name], age: params[:age], bio: params[:bio])
    redirect_to user_path(@user)
    
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :bio, :ago, :password, :password_confirmation)
   end
end
