class User < ApplicationRecord
    has_many :books
    has_many :pergolas, through: :books
    has_many :book_records, through: :books

end
