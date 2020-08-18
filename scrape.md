# def search(isbn_string)
#     key = ENV["ISBN_API_KEY"]
#     # binding.pry
#     response = RestClient.get("https://api2.isbndb.com/book/#{isbn_string}", headers={'Authorization': key})
#     result = JSON.parse(response.body)
#     title=result["book"]["title"]
#     author=result["book"]["authors"]
#     img_url=result["book"]["image"]
#     result["book"]["synopsis"] ? synopsis=result["book"]["synopsis"] : synopsis="The synopsis is not available"
#     simple = {title:title,author: author,synopsis:synopsis, img_url:img_url}
# end



book_isbns = ("9780007123810,9780007123827,9780007129706,9780007129720,9780007144082,9780007149131,9780007149148,9780007149216,9780007149230,9780007149247,9780007171972,9780007171996,9780007172009,9780007182367,9780007203604").split(",")
book_isbns1 = ("9780449213940,9780553212419,9781616897987,9783836565547,9783836560146,9783836535960,9783836560429,9781514682050").split(",")
book_isbns2 = ("9780545010221,9780590353427,9780747532743,9780747532743,8498386314").split(",")
book_isbns = book_isbns+book_isbns2+book_isbns1
records=book_isbns.map{|record|BookRecord.populate(record)}
creation_line=records.each{|record|BookRecord.find_or_create_by(record)}