class AddAreaIdToRooms < ActiveRecord::Migration[7.2]
  def change
    add_column :rooms, :area_id, :integer
  end
end
