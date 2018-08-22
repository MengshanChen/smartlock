class CreatePincodes < ActiveRecord::Migration[5.2]
  def change
    create_table :pincodes do |t|
      t.string :username
      t.integer :pcode

      t.timestamps
    end
  end
end
