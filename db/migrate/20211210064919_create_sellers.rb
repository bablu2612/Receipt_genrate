class CreateSellers < ActiveRecord::Migration[6.1]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :address
      t.string :vat_id
      t.string :business_id
      t.references :receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
