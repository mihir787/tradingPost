class RenameProposedTrades < ActiveRecord::Migration
  def self.up
    rename_table :proposed_trades, :trades
  end

  def self.down
    rename_table :trades, :proposed_trades
  end
end
