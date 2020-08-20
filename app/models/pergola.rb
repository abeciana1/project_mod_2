class Pergola < ApplicationRecord
    has_many :books
    has_many :users, through: :books
    has_many :book_records, through: :books
    validates :name, :address1, :city, :state, :zip_code, presence: true
    validates :zip_code, length: {is: 5}
end

