class UsersController < ApplicationController
  respond_to :html

  def index
  	@users = User.all.includes(:phones, :address)
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

  protected

  def user_params
    params.require(:user).permit([:name, phones_attributes: [:number], address_attribute: [:line, :zip]])  	
  end
end