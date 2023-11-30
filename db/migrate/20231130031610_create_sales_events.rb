class CreateSalesEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_events do |t|
      t.string :store
      t.string :model
      t.integer :inventory

      t.timestamps
    end
  end
end
