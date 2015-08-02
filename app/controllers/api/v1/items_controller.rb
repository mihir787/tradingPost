class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def create
    item = Item.create(item_params)
    respond_with :api, :v1, item
  end

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def update
    respond_with :api, :v1, Item.update(params[:id], item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                :description,
                                :descired_trade_items,
                                :picture,
                                :user_id)
  end

end
