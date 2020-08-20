class User < ApplicationRecord
    has_many :books
    has_many :pergolas, through: :books
    has_many :book_records, through: :books
    has_secure_password 

    validates :name, presence: true
    validates :email, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
