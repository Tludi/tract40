class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
    @user = Users.new
  end

  def create
    if @user
      redirect_back_or_to root_url, notice: "logged in"
    else
      redirect_to root_url, alert: "Email or Password was not valid"
    end
  end


  def destroy
    logout
    redirect_to root_url, notice: "logged out!"
  end

  private

    def set_user
      @user = login(params[:sessions][:email], params[:sessions][:Password])
    end

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
