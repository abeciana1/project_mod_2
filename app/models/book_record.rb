

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

    def self.populate(isbn_string)
      key = ENV["ISBN_API_KEY"]
      # binding.pry
      response = RestClient.get("https://api2.isbndb.com/book/#{isbn_string}", headers={'Authorization': key})
      result = JSON.parse(response.body)
      title=result["book"]["title"]
      author=result["book"]["authors"]
      img_url=result["book"]["image"]
      result["book"]["synopsis"] ? synopsis=result["book"]["synopsis"] : synopsis="The synopsis is not available"
      simple = {title:title,author: author,synopsis:synopsis, img_url:img_url}
    end

end
