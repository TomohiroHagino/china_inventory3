class CreateTakeInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :take_inventories do |t|
      t.date :fiscal_year
      t.integer :beginning_product_inventory
      t.integer :cost_of_sales
      t.integer :period_end_product_inventory
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
