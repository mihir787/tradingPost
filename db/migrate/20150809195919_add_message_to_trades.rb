class AddMessageToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :message, :string
  end
end
