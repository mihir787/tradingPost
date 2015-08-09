class ItemsController < ApplicationController
  

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if current_user
      if item.save
        current_user.items << item
        flash[:success] = "Item successfully created!"
        redirect_to user_path(current_user)
      else
        flash[:danger] = item.errors.full_messages.join(", ")
        render :new
      end
    else
      redirect_to login_path
      flash[:danger] = "You must be logged in to add an item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :desired_trade_items, :picture)
  end

end
