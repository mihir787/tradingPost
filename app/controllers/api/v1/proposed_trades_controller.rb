class Api::V1::ProposedTradesController < ApplicationController
  respond_to :json
  before_filter :sanitize_params, except: [:show, :index, :destroy]

  def create
    proposed_trade = ProposedTrade.create(proposed_trade_params)
    respond_with :api, :v1, proposed_trade
  end

  def index
    respond_with ProposedTrade.all
  end

  def show
    respond_with ProposedTrade.find(params[:id].to_i)
  end

  def update
    respond_with :api, :v1, ProposedTrade.update(params[:id].to_i, proposed_trade_params)
  end

  def destroy
    respond_with ProposedTrade.destroy(params[:id])
  end

  private

  def sanitize_params
    if params["proposed_trade"]["status"] == ("1" || "2")
      params["proposed_trade"]["status"] = params["proposed_trade"]["status"].to_i
    end
  end

  def proposed_trade_params
    params.require(:proposed_trade).permit(:status,
                                :item_id,
                                :user_id)
  end

end
