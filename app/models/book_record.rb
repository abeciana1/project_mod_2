class BookRecord < ApplicationRecord
  has_many :books
  has_many :pergolas, through: :books
  has_many :users, through: :books

    def self.search(query)
        if query.present?
          where('TITLE like ?', "%#{query}%")
        else
          self.all
        end
    end
end
