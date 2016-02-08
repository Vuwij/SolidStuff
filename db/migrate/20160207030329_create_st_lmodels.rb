class CreateStLmodels < ActiveRecord::Migration
  def change
    create_table :st_lmodels do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
