class UsersController < ApplicationController
  
  before_filter :check_sign_in

  before_filter :current_user
  
  def show
  	@user = User.find(params[:id])
  
  	@lists = List.all
  end
end
