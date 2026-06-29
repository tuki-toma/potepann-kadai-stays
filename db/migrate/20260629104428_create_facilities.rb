class CreateFacilities < ActiveRecord::Migration[7.2]
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :introduce
      t.integer :fee

      t.timestamps
    end
  end
end
