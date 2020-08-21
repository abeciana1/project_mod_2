class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized, only: [:new, :home, :contact, :about,:create]

    def home
        
    end

    def contact
        
    end

    def about
        
    end

    def show
        if @current_user != @user
            redirect_to user_path(@current_user)
        end
    end
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.admin=false
        @user.save
        if @user.valid?
          session[:user_id] = @user.id 
          redirect_to '/'
        else
            flash[:my_errors]=@user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def contra
        @user = User.new
        session[:contra] = "What is the password?"
    end

    def verify
        # byebug
        if params[:query] == User.verification
            @current_user.admin = true
            @current_user.save
            session[:success] = "You're now an admin"
            redirect_to '/'
        else
            redirect_to '/'
        end
    end
    
    def edit;end

    def update
        @user =@User.update(user_params)
        if @user.update?
            redirect_to user_path
        else
            flash[:my_errors]=@user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end
    
    private
    def find_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :admin)
    end

end