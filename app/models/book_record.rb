

class BookRecord < ApplicationRecord
  has_many :books
  has_many :pergolas, through: :books
  has_many :users, through: :books
  # validates_uniqueness_of :isbn13, :allow_nil => true, :allow_blank => true
  # validates_uniqueness_of :isbn, :allow_nil => true, :allow_blank => true

    def self.search(query)
        if query.present?
          where('TITLE like ?', "%#{query}%")
        else
          self.all
        end
    end

    def self.populate(isbn_string)
      key = ENV["ISBN_API_KEY"]
      response = RestClient.get("https://api2.isbndb.com/book/#{isbn_string}", headers={'Authorization': key}){|response, request, result| response }
      result = JSON.parse(response.body)
      if result["book"]
      title=result["book"]["title"]
      author=result["book"]["authors"]
      img_url=result["book"]["image"]
      isbn13=result["book"]["isbn13"]
      isbn=result["book"]["isbn"]
      result["book"]["synopsis"] ? synopsis=result["book"]["synopsis"] : synopsis="The synopsis is not available"
      simple = {title:title,author: author,synopsis:synopsis, img_url:img_url,isbn13:isbn13, isbn:isbn}
      else 
        false
      end
    end

    def self.populate_by_author(author)
      key = ENV["ISBN_API_KEY"]
      response = RestClient.get("https://api2.isbndb.com/author/#{author}", headers={'Authorization': key})
      result = JSON.parse(response.body)
      results =result["books"] 
    end

end
