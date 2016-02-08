class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.float :price
      t.string :description
      t.string :fileurl

      t.timestamps null: false
    end
  end
end
