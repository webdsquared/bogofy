class ItemsController < ApplicationController
  

  def create
    @user = current_user
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.create(params[:item])
    respond_to do |format|
      format.html { redirect_to user_list_path(@user, @list) }
      format.js
    end
  end

  #def edit
  #  @item = Item.find(params[:id])
  #end
#
  #def update
  #  @item = Item.find(params[:id])
  #  if @item.update_attributes(params[:item])
  #    redirect_to @item, :notice  => "Successfully updated item."
  #  else
  #    render :action => 'edit'
  #  end
  #end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :back
  end
end
