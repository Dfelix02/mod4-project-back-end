class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :purchase, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
