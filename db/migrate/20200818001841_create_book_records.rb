class CreateBookRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :book_records do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.string :img_url
      t.string :isbn13
      t.string :isbn
      t.boolean :feature, :default => false 

      t.timestamps
    end
  end
end
