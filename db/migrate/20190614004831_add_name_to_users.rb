class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :Name, :string
  end
end
