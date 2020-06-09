class ApplicationController < ActionController::Base
    helper_method :current_shop, :logged_in?
    def logged_in?
        !!current_shop
    end
    def current_shop
        @current_shop ||= Shop.find(session[:shop_id]) if session[:shop_id]
    end
    def require_shop
        if !logged_in?
            flash[:danger] = "you must be logged in to perform that action"
            redirect_to root_path
        end
    end
    
end
