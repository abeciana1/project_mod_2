class PergolasController < ApplicationController
    before_action :find_pergola, only: [:show, :edit, :update, :delete]
    before_action :authorized_admin, except: [:show, :index]
    skip_before_action :authorized, only: [:index, :show]

    def index
        @pergolas = Pergola.all
    end
    
    def new
        @pergola = Pergola.new
        @states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "IllinoisIndiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "MontanaNebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "PennsylvaniaRhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    end
    
    def show
    end
    
    def create
        @pergola = Pergola.new(pergola_params)
        if @pergola.valid?
        @pergola.save
        redirect_to pergola_path(@pergola)
        else
        flash[:my_errors] = @pergola.errors.full_messages
        redirect_to new_pergola_path
        end
    end
    
    def edit
    end
    
    def update
        if pergola.save?
            @pergola.update(pergola_params)
            redirect_to pergola_path(@pergola)
        else
            flash[:my_errors] = @pergola.errors.full_messages
            redirect_to edit_pergola_path
        end
    end
    
    def delete
        @pergola.destroy
        redirect_to pergolas_path
    end
    
    private
        
    def find_pergola
        @pergola = Pergola.find(params[:id])
    end
    
    def pergola_params
        params.require(:pergola).permit(:name, :address1, :address2, :city, :state, :zip_code)
    end    
end
