class AddDetailsAndAddressToFacilities < ActiveRecord::Migration[7.2]
  def change
    add_column :facilities, :description, :text
    add_column :facilities, :address, :string, null:false
  end
end
