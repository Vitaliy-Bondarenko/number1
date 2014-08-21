class AddActivecodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Active_Code, :string
  end
end
