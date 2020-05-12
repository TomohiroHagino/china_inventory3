class CreateBuyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_items do |t|

      t.timestamps
    end
  end
end
