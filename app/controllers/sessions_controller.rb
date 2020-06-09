class SessionsController < ApplicationController
    def new
        
    end
    def create
        shop = Shop.find_by(email: params[:session][:email])
        if shop && shop.authenticate(params[:session][:password])
            session[:shop_id] = shop.id
            flash[:success] = "welcome to the site"
            redirect_to shop_path(shop)
        else
            flash.now[:danger] = "you have successfully logged out"
            render 'new'
        end
    end
    def destroy
        session[:shop_id] = nil
            flash[:success] = 'you have successfully logged out'
            redirect_to root_path
    end
    
end
