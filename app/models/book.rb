class Book < ApplicationRecord
    belongs_to :book_record
    belongs_to :user, optional: true
    belongs_to :pergola
    validates :book_record, uniqueness:true 
end
