class UsersController < ApplicationController
  respond_to :html

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:phones, :address)
  	respond_with(@users)
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def new
    @user = User.new
  end

  def show
    @user = find_user
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user = find_user
    @user.destroy
    redirect_to users_path
  end

  protected

  def find_user
    User.find params[:id]
  end

  def user_params
    params.require(:user).permit([:name, 
      phones_attributes: [:number, :id],
      address_attributes: [:line1, :zip, :id]])
  end
end