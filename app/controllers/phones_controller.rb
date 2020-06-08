class PhonesController < ApplicationController
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
        @phone = Phone.find(params[:id])
    end
    def edit
        @phone = Phone.find(params[:id])
    end
    def update
        @phone = Phone.find(params[:id])
        if @phone.update(phone_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @phone
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    def destroy
        @phone = Phone.find(params[:id])
        if @phone.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to phones_path
        end
    end
    
    private
    def phone_params
        params.require(:phone).permit(:name, :description, :price)
    end
    
end
