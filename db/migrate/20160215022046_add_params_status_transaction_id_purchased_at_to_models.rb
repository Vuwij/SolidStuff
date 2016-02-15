class AddParamsStatusTransactionIdPurchasedAtToModels < ActiveRecord::Migration
  def change
    add_column :models, :notification_params, :text
    add_column :models, :status, :string
    add_column :models, :transaction_id, :string
    add_column :models, :purchased_at, :datetime
  end
end
