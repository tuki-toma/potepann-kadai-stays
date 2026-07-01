class AddIntroduceToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :introduce, :text
  end
end
