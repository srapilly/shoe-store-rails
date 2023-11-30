class CreateSalesEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_events do |t|
      t.string :store, null: false
      t.string :model,  null: false
      t.integer :inventory, null: false

      t.timestamps
    end
  end
end
