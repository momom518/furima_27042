class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :purchase,   foreign_key: true
      t.references :user,       foreign_key: true
      t.string :card_token,     null: false
      t.string :customer_token
      t.timestamps
      
    end
  end
end
