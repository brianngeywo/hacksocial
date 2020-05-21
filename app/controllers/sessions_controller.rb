class SessionsController < ApplicationController
    before_action :login_redirect, only: [:new,:create]
    def new
    end
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
           flash[:success] = "Login successfull"
           redirect_to root_path
        else
            flash.now[:danger] = "There was something wrong with the login information"
            render 'new'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:success] = "logout successfull"
        render 'new'
    end

    private
    def login_redirect
        if logged_in?
            flash[:error] = "you are already logged in"
            redirect_to root_path
        end
    end
end
