class RegistrationController < ApplicationController


  def home
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def new

  end

  def check
    @current_user = User.where(email: params[:email], password: params[:password]).first
    if @current_user
     flash[:info] = "Bienvenue #{@current_user.first_name} !"
     session[:current_user_id] = @current_user.id
     puts session[:current_user_id]
     redirect_to root_path

    else
     flash[:info] = "Échec de la connexion"
     session[:user_id] = nil
     redirect_to registration_new_path
    end

  end


end
