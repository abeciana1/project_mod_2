class PergolasController < ApplicationController
    before_action :find_pergola, only: [:show, :edit, :update, :delete]
    
    def index
        @pergolas = Pergola.all
    end
    
    def new
        @pergola = Pergola.new
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
        @pergola.update(pergola_params)
        redirect_to pergola_path(@pergola)
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
        params.require(:pergola).permit(:name)
    end
    
    
end
