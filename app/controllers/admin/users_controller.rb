class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_login, except: :update
  before_action :check_admin, except: :update
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html {redirect_to admin_users_path, notice: "Create user successfully."}
            format.json {render json: {user: @user}, status: :created}
        else
          format.html {render 'new'}
            format.json {render json: {messages: @user.errors.full_messages}, status: :unprocessable_entity}
        end
      end
    end

    def show
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Update user successfully."
      else
        render 'edit'
      end
    end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "Delete user successfully."
  end

  private
    def check_admin
      if current_user.role != "Admin"
        redirect_to home_path, alert: "You do not have permission to access admin."
      end
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :password, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end
    
    def check_login
        if current_user.nil?
          redirect_to signin_path, alert: "You have to sign in."
        end
      end
end