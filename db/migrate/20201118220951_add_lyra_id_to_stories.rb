class AddLyraIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :lyraID, :string
  end
end
