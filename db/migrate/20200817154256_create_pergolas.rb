class CreatePergolas < ActiveRecord::Migration[6.0]
  def change
    create_table :pergolas do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
