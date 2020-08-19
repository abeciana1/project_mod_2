class User < ApplicationRecord
    has_many :books
    has_many :pergolas, through: :books
    has_many :book_records, through: :books
    validates :email, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
