class AddSlotToPincodes < ActiveRecord::Migration[5.2]
  def change
    add_column :pincodes, :slot, :integer
  end
end
