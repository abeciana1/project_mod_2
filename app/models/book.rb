class Book < ApplicationRecord
    belongs_to :book_record
    belongs_to :user, optional: true
    belongs_to :pergola
    # validates :book_record, uniqueness: true 
    # validates cannot_have_more_than_one_of_the_same_book_record_at_one_location
    validates :pergola_id, :uniqueness => {:scope=>:book_record_id}
    validates :count, numericality: { greater_than_or_equal_to: 0}

end
