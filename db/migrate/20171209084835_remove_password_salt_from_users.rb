class RemovePasswordSaltFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_salt, :string
  end
end
