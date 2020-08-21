# Community Pergolas

# WHY?
We decided to work on this project because we saw a unique book API that we like.

The API link example looks like this, # https://api2.isbndb.com/book/#{isbn_string}. 

Our API requires a API Key to work The company that owns the API wanted our money, but we signed up for a trial instead (Thanks, Alex!).

# Why Communities
I would like to think that as a community that we are aiming/striving for a better future together. The first books that I ever owned were Nancy Drew books from a family friend's daugther. They were the only books I had before I made it to the library. I would like to think that a lot of children would benefit from reading actual books. 

There are many book donation centers all over the world. Places where people can freely donate books and members of the community read them. We would like to believe that our community members will work to better the community. We do not have the expectation that people will not steal books, but we hope that enough members of the community will enforce positive behavior. Our hope is that volunteers would step up, maintain the Pergolas, and the database. 

# How it works?
1. For all visitors that vist our site, we want them to be able to access the following pages:
Home // About // Contact // Locate A Pergola

'Locate A Pergolas' is a pergolas#index page- They can see where our Pergolas are located.

2. To access the rest of the site and have more utiility, we want our visitors to become users. Please sign up to check out what cool functions you may have. 

    * "Find A Book" is a Book_Record#index - This page contains books that are in our database. Users can search to see if we have a book that they want. 
    * Users can navigate to the Book_Record#show page - This page can be accessed by clicking on the book title. This page shows the book information, which Pergola has copies of the book, and how many copies are at the Pergola.
    * users#show -  User access their own user pages only by clicking on their name, where they can edit their information or even delete their account. 

3. Finally, we have our volunteers. Volunteers are an essential park of any non profit. They will extra responsibiities listed below:

    * Our users(volunteers) can update their profile to become an admin (unpaid) for our books database. They will be given a secret webpage and a code to update their profile to gain authorization.
    * The Nav bar for our volunteers are updated to reflect their new responsibilities
    * book_records#show - Our volunteers will see buttons to edit and delete the record
    * book_records#new - Our volunters can 'add a book' to our database. If the book is already in the API database, our software will automatically update the book record information per the API database. If the book is not in the API database, our software will default to user input. After the book_record is created, the volunteer will need (and can only) assign the book to one Pergola location. 
    * book_recordss#new - Admins can allocate books to Pergolas. If a book already exists in a Pergola, our volunteers will be given a link to go edit the quantity at the Pergola location. If the book does not exist in the Pergola, the connection can be made via the edit page.
    * pergolas#show - Admin users can access the individual pergola page and click on a now 'visible link' to update the quantity. They can also edit the details of the pergola. They can also 'bulldoze' for the pergola. 
    * users#index - Our volunteers can go to the 'Manage Users' page to update and delete users

4. Our book_record database is derived from the API. We have the ability to draw from the API
    * Typing an ISBN or an ISBN13 into our database will prompt our system to look up the ISBN/ISBN13 from the API. If the book is in the database, information from the database will completely override the inputs of the user. If the book does not exists, the details that the volunteer has inputted will be used to create a new book. The flt prefix is for all books that we were not able to find in our database
    * Upon creation, the volunteer will be brought to a page where they have to assign the book to the Pergola of choice. Our volunteers must be careful when creating books. If they are clumsy like me, they will just need to go, find their Frankensteinian creation, and KILL IT!!! (delete it from our database)
    * There is anothe feature in the book_record page which will allow the user to look up books by author. This will render up to 1000 results if you type in the last name of the author (no spaces or funny characters). In the same search bar, you can now copy and paste an ISIN into into it. This will create the book_record and send the user to the new_book page.


Below are test subjuts to in inputted as manual entries in our APP. 

The Forbidden Planet
Ian Rosen
9781523775958
https://images-na.ssl-images-amazon.com/images/I/412POj1A9fL._SX331_BO1,204,203,200_.jpg
1523775955
The year is 2276 and humans have long since left their home planet, Earth. Now they are spread across the Andromeda galaxy among thirty-three new colonies. Jason Frost has become complacent in a life of lonely non-achievement on New Earth. He can't seem to do anything right with his life, including keeping the woman he loves by his side. After leaving him to join Space Command and Patrol, she has gone missing. A mysterious new comrade knows exactly where to find her. But there's a catch. She is somewhere no one would ever think to look. Only Jason has the power to find her and save her and the entire universe from the turmoil that is about to ensue.