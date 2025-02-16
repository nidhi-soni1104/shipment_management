class CreateShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :shipments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :delivery_partner, null: false, foreign_key: true
      t.string :source
      t.string :target
      t.string :status

      t.timestamps
    end
  end
end
