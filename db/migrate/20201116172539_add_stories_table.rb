class AddStoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :tag, null: false

      t.index :title, unique: true
      t.index :tag
      t.timestamps
      
    end
  end
end
