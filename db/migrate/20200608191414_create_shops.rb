class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :about
      t.string :email
      t.integer :phone_number
      t.timestamps
    end
  end
end
