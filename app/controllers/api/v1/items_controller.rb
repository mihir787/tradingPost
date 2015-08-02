class Api::V1::ItemsController < ApplicationController
  respond_to :json
  before_filter :sanitize_params, except: [:show, :index, :destroy]

  def create
    item = Item.create(item_params)
    respond_with :api, :v1, item
  end

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id].to_i)
  end

  def update
    respond_with :api, :v1, Item.update(params[:id].to_i, item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id].to_i)
  end

  private

  def sanitize_params
    params["item"]["status"] = params["item"]["status"].to_i
  end

  def item_params
    params.require(:item).permit(:title,
                                :description,
                                :descired_trade_items,
                                :picture,
                                :status,
                                :user_id)
  end

end
