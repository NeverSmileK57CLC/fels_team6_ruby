class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.json{render json: {users: @users.as_json(except: :password)}, status: :ok}
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

    respond_to do |format|
    	if @user.save
    		format.html {redirect_to user_path(@user)}
        format.json {render json: {user: @user}, status: :created}
    	else
    		format.html {render 'new'}
        format.json {render json: {messages: @user.errors.full_messages}, status: :unprocessable_entity}
    	end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to user_path(@user), notice: "Update user successfully."}
        format.json {render :show, status: :updated}
      else
        format.html {render :edit}
        format.json {render json: {messages: @user.errors.full_messages}, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to admin_path, notice: "Delete user successfully."}
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:fullname, :email, :password, :role)
  	end

    def set_user
      @user = User.find(params[:id])
    end
end
