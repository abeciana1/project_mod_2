# Community Pergolas

# WHY?
We decided to work on this project because we saw a unique book API that we like.
API Link example: # https://api2.isbndb.com/book/#{isbn_string}
Our API link needs a API Key will only "PAYING" customers will get. We did a trail for 7 days (Thanks, Alex!)

# Why Communities
I would like to think that as a community that we are aiming/striving for a better future together. The first books that I ever owned were Nancy Drew books from a family friend's daugther. They were the only books I had before I made it to the library. I would like to think that a lot of children would benefit from reading actual books. 

There are already many book donation centers all over the world. Places where people can freely donate books and members of the community can come read. We would like to believe that our community members will work to better the community. We do not have the expectation that people will not steal books, but we hope that enough members of the community will enforce positive behavior. Our hope is that volunteers would step up, maintain the Pergolas, and the database. 

# How it works?
1. For all visitors that vist our site, we want them to be able to access the following pages:
Home // About // Contact // Pergolas#index - They can see where our Pergolas are and will be motivate to join our awesome community 

2. To access more of the site and more functions, we want our users to access what vistors can access and the following pages:
a. Book_Record#index - Books that are in our database. They can search to see if we have a book they want. 
b. Book_Record#show - This page will show the book information, which Pergola contains how many copies, and total copies
c. User#show -  User access their own pages only. They can change their information. They can also delete their accouts. 

3. Finally, we have our volunteers. Volunteers will be able to add books in our system. 
a. Our users(volunteers) will be update their profile to become an admin (unpaid) for our books database. They will be given a secret webpage and a code to update their profile 
b. The Nav bar of our volunteers are updated to reflect their new responsibilities
c. Book_Record#Show - Our volunteers will see buttons to edit and delete the record
d. Books#new - They can also allocate books to pergolas // If a book already exists in a Pergola, our volunteers will be given a link to go edit the quantity at the Pergola location. If the book does not exists in the Pergola, the connection will be made. 
e. pergolas#show - They can also access the individual pergola page and click on a now 'visible link' to update the quantity. They can also edit the details of the pergola. They can also 'bulldoze' for the pergola. 
f. Users#index - Our volunteers can go to the 'Manage Users' page to update and delete users
g. book_records#new - Our voluntters can also 'add record' to our data base. This is a powerful feature

4. Our book_record database is derived from the API. We have the ability to draw from the API
a. Typing a ISBN or an ISBN into our database will prompt our system to look up the ISBN/ISBN13 from the API. If the book is in the database, information from the database will completely override the inputs of the user. If the book does not exists, the details that the volunteer has inputted will be used to create a new book. The flt prefix is for all books that we were not able to find in our database
b. Upon creation, the volunteer will be brought to a page where they have to assign the book to the Pergola of choice. Our volunteers must be careful when creating books. If they are clumsy like me, they will just need to go, find their Frankensteinian creation, and KILL IT!!! (delete it from our database)
c. 



