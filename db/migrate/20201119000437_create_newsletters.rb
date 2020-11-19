class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :date
      t.text :html
      t.index :date, unique: true
      t.timestamps
    end
  end
end
