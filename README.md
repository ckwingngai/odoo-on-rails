# README

### Installation (Mac)
* Install RVM: `\curl -sSL https://get.rvm.io | bash`
* Load the config: `source ~/.rvm/scripts/rvm`
* Install / Update Ruby: `rvm install 2.3.0`
* Install the postgreSQL: `brew update` & `brew install postgresql`
* Install Bundler: `sudo gem install bundler`
* Install Rails: `gem install rails`
* Run `bundle` will Install all gems in _/Gemfile_ similar to node packages

### DB setting
* Install postgreSQL
* Install pgAdmin as an admin panel
* Path: _/config/database.yml_
* Change username and password

### Static file
* _/public_

### Lauch server
* `rails s`

### Create a table
* `rails g model [field_name]:[field_type]`
* `rails db:migrate`

### Update the table
* `rails g migration AddSomeThingToModel some_thing:string`
* SomeThing && some_thing is the attribute name added while Model is the table being updated
* `rails db:migrate`

### Drop DB
* `rails generate migration DropProductsTable`
* `def up
    drop_table :products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end`

### Roll Back DB change
* `rails db:migrate:down VERSION=20100905201547`

### Many - Many relationship
* `has_many :through`
* After that join table can be done by directly calling class attributes
* http://guides.rubyonrails.org/association_basics.html

### Email
* `rails g mailer example_mailer`
* _in app/mailers/example_mailer.rb_
* Add
  `default from: "from@example.com"`
  `def sample_email
    mail(to: email, subject: 'Sample Email')
  end`
* Add files in _app/views/example_mailer/sample_email.html.erb_ and _app/views/example_mailer/sample_email.text.erb_
* Preview in _test/mailers/previews/example_mailer_preview.rb_
  `def sample_mail_preview
    ExampleMailer.sample_email()
  end`
  preview link: http://localhost:3000/rails/mailers/example_mailer/sample_mail_preview
* reference: https://launchschool.com/blog/handling-emails-in-rails, https://ihower.tw/rails4/actionmailer.html

### Set environment variables
* reference: http://railsapps.github.io/rails-environment-variables.html

### Debug
* `rails c`
* Similar method to meteor shell to access model classes

### Auth0
* https://manage.auth0.com/#/clients/hDb34f1c3evZ6o4nTW8WRdlbELoGdpE7/quickstart

### Remarks
* Changes under _/config/ folder needed to be refreshed
