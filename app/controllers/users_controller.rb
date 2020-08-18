class UsersController < ApplicationController
    before_action :find_user [:show, :edit, :update, :destroy]
     
    def home
        
    end

    def show;end
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to users_path
        else
            flash[:errors]=@user.errors.full_messages
            redirect_to new_user_path
        end
    end
    
    def edit;end

    def update
        @user =User.update(user_params)
        if @user.update?
            redirect_to users_path
        else
            flash[:errors]=@user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def delete
        @user.destroy
        redirect_to users_path
    end
    
    private
    def find_user
        @user = User.find(user_params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name)
    end

end