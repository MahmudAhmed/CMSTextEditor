class AddLyraIdtoNewsletter < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :lyraID, :string
  end
end
