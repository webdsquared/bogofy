class ListsController < ApplicationController
  
  before_filter :check_sign_in

  def index
    @user = current_user
    @lists = @user.lists.all
  end

  def show
    @user = current_user
    @list = @user.lists.find(params[:id])
    @item_list = @list.items.all
  end

  def new
    @user = current_user
    @list = @user.lists.new
  end

  def create
    @user = current_user
    @list = @user.lists.create(params[:list])
    if @list.save
      redirect_to user_lists_path, :notice => "Successfully created list."
    else
      render :action => 'new'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list, :notice  => "Successfully updated list."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url, :notice => "Successfully destroyed list."
  end
end
