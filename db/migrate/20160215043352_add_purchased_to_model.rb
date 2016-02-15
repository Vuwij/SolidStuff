class AddPurchasedToModel < ActiveRecord::Migration
  def change
    add_column :models, :purchased, :string
  end
end
