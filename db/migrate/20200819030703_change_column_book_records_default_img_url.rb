class ChangeColumnBookRecordsDefaultImgUrl < ActiveRecord::Migration[6.0]
  def change
    change_column :book_records, :img_url, :string, :default => "app/assets/images/placeholder-book-cover-default (1).png"
  end
end
