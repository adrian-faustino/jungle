class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.new(user_params)

    @existing = User.where(email: params.require(:user)[:email]);

    if @existing.length > 0
      return;
    elsif params.require(:user)[:password] != params.require(:user)[:password_confirmation]
      return;
    end

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def error
    render 'create'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:password_digest)
  end  
  
end
