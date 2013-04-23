class UsersController < ApplicationController
  
  before_filter :check_sign_in
  
  def show
  	@user = User.find(params[:id])
  end
end
