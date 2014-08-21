class RenameActivecodeToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :Active_Code, :active_code
  end
end
