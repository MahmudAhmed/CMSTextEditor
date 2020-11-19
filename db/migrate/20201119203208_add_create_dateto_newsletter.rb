class AddCreateDatetoNewsletter < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :published_date, :string
    add_column :stories, :published_date, :string
    remove_column :stories, :newsletter_id

  end
end
