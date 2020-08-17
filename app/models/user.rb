class User < ApplicationRecord
    has_many :books
    has_many :pergolas, through: :books
end
