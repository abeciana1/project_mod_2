

class Pergola < ApplicationRecord
    has_many :books
    has_many :users, through: :books
    has_many :book_records, through: :books
end
