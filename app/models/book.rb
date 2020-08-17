class Book < ApplicationRecord
  belongs_to :pergola
  belongs_to :user
end
