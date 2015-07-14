class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :zip
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
