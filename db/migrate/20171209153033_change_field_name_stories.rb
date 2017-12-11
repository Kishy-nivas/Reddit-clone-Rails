class ChangeFieldNameStories < ActiveRecord::Migration[5.1]
  def change
    change_column :stories, :link ,:text 
  end
end
