class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :name, :string
  end
end
