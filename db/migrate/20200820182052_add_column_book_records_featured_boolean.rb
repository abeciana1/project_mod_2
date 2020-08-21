class AddColumnBookRecordsFeaturedBoolean < ActiveRecord::Migration[6.0]
  def change
    add_column :book_records, :featured, :boolean, :default => false
  end
end
