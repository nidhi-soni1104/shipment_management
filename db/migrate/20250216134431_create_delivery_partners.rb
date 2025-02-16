class CreateDeliveryPartners < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_partners do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
