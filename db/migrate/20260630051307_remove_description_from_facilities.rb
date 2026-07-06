class RemoveDescriptionFromFacilities < ActiveRecord::Migration[7.2]
  def change
    remove_column :facilities,:description,:text
  end
end
