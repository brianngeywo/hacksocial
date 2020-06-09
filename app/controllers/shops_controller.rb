class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :show]
  before_action :require_same_shop, only: [:edit, :update]
    def index
        @shops = Shop.all
    end
    def new
        @shop = Shop.new
    end
    def create
        @shop = Shop.new(shop_params)
        if @shop.save
          flash[:success] = "Object successfully created"
          redirect_to @shop
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
    
        if @shop.update(shop_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @shop
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    private
    def shop_params
        params.require(:shop).permit(:name, :email, :about, :phone_number, :password)
    end
    def set_shop
      @shop = Shop.find(params[:id])
    end
    def require_same_shop
      if current_shop != @shop
      redirect_to root_path
      end
    end
end
