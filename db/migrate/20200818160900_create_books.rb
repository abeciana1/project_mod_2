class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer "book_record_id"
      t.integer "pergola_id"
      t.integer "user_id"
      t.timestamps
    end
  end
end
