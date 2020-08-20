class ChangeColumnnBookRecordsFeatured < ActiveRecord::Migration[6.0]
  def change
    change_column :book_records, :featured, :boolean, :default => nil
  end
end
