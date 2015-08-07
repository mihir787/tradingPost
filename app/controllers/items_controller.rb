class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash.now[:success] = "Item successfully created!"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = item.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :desired_trade_items, :picture)
  end

end
