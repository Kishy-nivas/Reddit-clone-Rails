class AddPointsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :points, :integer
  end
end
