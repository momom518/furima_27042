class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id, null:false
      t.integer :postal_code, null:false
      t.string :city
      t.string :address
      t.string :building
      t.string :telephone_number
      t.timestamps
    end
  end
end
