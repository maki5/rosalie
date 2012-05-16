#Rosalie

Simple gem that alows users to message each other

Installation
------------

Add to your Gemfile:

````
gem 'rosalie', :git => "git://github.com/maki5/rosalie.git"
````

Then run:

````
$ bundle install
````

Run install script:

````
$ rails g rosalie:install
````

And don't forget to migrate you database:

````
$ rake db:migrate
````

## Requirements & Settings

First of all you need a User model, you can create it yourself or use some authentication system

## Preparing your models
In your model:

````ruby
class User < ActiveRecord::Base
  acts_as_messageable
end
````

````ruby
class Message < ActiveRecord::Base
  has_user
end
````

##Rosalie

### Send message
````ruby
User.send_message([recipient], "subject", "body")
````

### Show sent messages by user
````ruby
User.sent_messages
````

### Show recieved messages by user
````ruby
User.recieved_messages
````

##Views
If you need views you can run views generator

````
$ rails g rosalie:views
````

###Action Mailer
You need to set up default url options for the mailer in each environment. Here is the configuration for "config/environments/development.rb":

```ruby
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
```
and default email
```ruby
ActionMailer::Base.default :from => 'default@development-server.com'
```

## License
MIT License. Copyright © 2012 Ababii Alexandr

