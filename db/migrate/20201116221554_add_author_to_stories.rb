class AddAuthorToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :author, :string, :default => "Mahmud Ahmed"
  end
end
