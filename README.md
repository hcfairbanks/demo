#Demo Project

This project is for demo purposes only.<br/>
It is not a completed stand-alone project.<br/>
This project demonstrates the use of<br/>

- Authentication
- Authorization
- Testing ( Rspec, FactoryGirl, Database Cleaner)
- Secure file management
- Polymorphic associations
- Image management (including extensive testing)
- User management
- Jquery
- Translations
- Overriding default activerecord error messages
- Pagination
- sass (Just a little bit, and it's currently ugly)


#TODO
Here are a few thngs I am familiar with but have not yet implemented

- Improve GUI
#- Upgrade to rails 5
#- Replace paperclip to carrierwave
#- Replace authlogic with devise
#- Action emailer
- jbuilder
- More advanced search for posts
- add internal password changer for admins only
- add auditing

#Installation
Paper clip requires imagemagick<br/>
Reference the following for installation instructions<br/>
https://github.com/thoughtbot/paperclip<br/>

After you seed the db you can sign in with a default user<br/>
email: admin@test.com<br/>
pw: password<br/>

Please feel free to contact me if you have any questions.<br/>

Harry Fairbanks<br/>
hcfairbanks@gmail.com<br/>

==========================================================================

** new posts page show ing user id at bottom. must remove this
** json.builder
** user id needs to be manditory on post
** user id needs to be manditory on comment
** post id needs to be manditory on comment
** model specs need to be checked and varified
** price must be stoped from turinging into interger
** Factories need to be fixed
** make links real in nav bar
** comments spec needs to be reworked as many actions arent used
** Routes needs to be accurate
** user_session is weird, Destroy section commented , redirect thingy
** look close at post destroy
** routes login logout
** Change default user type  ### users _form
** post show .. javascript
** sass
** review gem file
** current_user in application controller
** Make rspec work with cancancan
** image attribute issue, ensure solution is working and old code is removed
** Translations
** rspec after test remove test folder
** Upgrade to rails 5


TODO
1. Add multi pictures to posts
2. Fix the editing so it passes the image id along ? Don't know if this is needed.
5. * fix the price search
7. Remove DOB
8. Comments need edit / delet feature
9. Admin Users need an editable section for users roles
10. All created roles need to default to user, without a post in from the registration view
11. Commenst need user thumb nails
13. users arent getting the proper roles assigned them
14. internal / external signup forms beacus eof role id
15. assignments needs to be renamed
16  Moch learn stubs https://github.com/freerange/mocha
17. stubs and mocs https://vimeo.com/68116218
18. http://railscasts.com/episodes/71-testing-controllers-with-rspec?autoplay=true
19. Add readme file that explains what's being demostrated
20. Translations in rspec tests too . . . Iam not sure about this one ?
21. test descriptions are not inaccordance with convention
22. replace paperclip to carrierwave
23. replace authlogic with devise
24. Action emailer needed
25. jbuilder needed, jbuilder return lists of posts , users
26. More advanced search for posts
27. Add some sass
28. Posts image gallery
29. Lookat image model, maybe account for empty images array
30. Action mailer on sign up (confirm email) and reset password email in edit user
31. Search post between low x and high y price
32. cancancan autherization rules
33. Add status to Posts
34. Change name of Posts to items
35. Add categories for Posts
36. Add Custom Search
37. Stop Current_user from being added to friends list


# This line will be needed  specifically the .first_or_initialize for a group of images
<%= link_to image_tag("#{root_url}#{post.images.first_or_initialize.id}/thumb/serve_image"), post_path(post) %>

@path = ":rails_root/images/#{Rails.env}_images/:external_user/:external_type/:id/:style/:filename"
#, preserve_files: "false" #this only preserve files, dosen't prevent retention

bin/rails db:environment:set RAILS_ENV=development

RAILS_ENV="test" bundle exec rspec spec/controllers/users_controller_spec_2.rb:10

db:drop         - will drop database.
db:create       - will create database (host/db/password will be taken from config/database.yml)
db:migrate      - will run existing migrations from directory (db/migration/.rb)*.
db:seed         - will run seed data possible from directory (db/migration/seed.rb)..
db:schema:dump  - will drop schema for fresh create
db:reset        - Havent used this yet
db:test:prepare - Havent used this yet


rake db:drop db:schema:dump db:create db:migrate db:seed

rake db:drop db:create db:migrate db:seed

rails g migration create_statuses name:string
rails g migration create_conversations
rails g migration create_messages content:string user:references # refernce create teh foreign key



Many to Many
A user has many communities
Communities have many users

controller add user to community
remove user from community

communities_users
