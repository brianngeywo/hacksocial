class PagesController < ApplicationController
    def home
        redirect_to phones_path if logged_in?
    end
    
end
