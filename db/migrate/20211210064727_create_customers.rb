class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :order_id
      t.string :payment_method
      t.references :receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
