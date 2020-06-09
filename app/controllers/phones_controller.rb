class PhonesController < ApplicationController
    before_action :set_phone, only: [:edit, :update, :show, :destory]
    before_action :require_shop, except: [:index, :show]
    before_action :require_same_shop, only:[:edit, :update, :destroy]
    def index
        @phones = Phone.all
    end
    def new
        @phone = Phone.new
    end
    def create
        @phone = Phone.new(phone_params)
        @phone.shop = Shop.last
        if @phone.save
          flash[:success] = "Object successfully created"
          redirect_to @phone
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    def show

    end
    def edit

    end
    def update

        if @phone.update(phone_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @phone
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    def destroy

        if @phone.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to phones_path
        end
    end
    
    private
    def phone_params
        params.require(:phone).permit(:name, :description, :price)
    end
    def set_phone
      @phone = Phone.find(params[:id])
    end
    def require_shop
      if !logged_in?
        redirect_to root_path
      end
    end
    def require_same_shop
      if current_shop != @phone.shop
        redirect_to root_path
      end
    end
end
