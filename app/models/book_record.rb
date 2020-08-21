require 'pry'
require "net/http"
require "json"
require "httparty"

class BookRecord < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :pergolas, through: :books
  has_many :users, through: :books
  validates :title, :author, presence: true
  validates_uniqueness_of :isbn13, :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :isbn, :allow_nil => true, :allow_blank => true

    def self.search(query)
        if query.present?
          where('TITLE like ?', "%#{query}%").order('title ASC')
        else
          self.all.sort_by{|b|b.title}
        end
    end

    def self.populate(isbn_string)
      key = ENV["ISBN_API_KEY"]
      response = RestClient.get("https://api2.isbndb.com/book/#{isbn_string}", headers={'Authorization': key}){|response, request, result| response }
      result = JSON.parse(response.body)
      if result["book"]
      title=result["book"]["title"]
      author=result["book"]["authors"].uniq.join
      img_url = result["book"]["image"]
      replace= "https://firstfreerockford.org/wp-content/uploads/2018/08/placeholder-book-cover-default.png"
      img_url = replace if RestClient.get(img_url){|response, request, result| response }.code == 404
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

    def self.image_checker
      BookRecord.all.each do |record|
        record.img_url = "https://firstfreerockford.org/wp-content/uploads/2018/08/placeholder-book-cover-default.png" if RestClient.get(record.img_url){|response, request, result| response }.code == 404
        record.save
      end
    end

    def self.image_count
      BookRecord.all.map do |record|
        RestClient.get(record.img_url){|response, request, result| response }.code
      end
    end

end

