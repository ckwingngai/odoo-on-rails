# README

### Installation
* `bundle`

### DB setting
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
* http://guides.rubyonrails.org/association_basics.html

### Auth0
* https://manage.auth0.com/#/clients/hDb34f1c3evZ6o4nTW8WRdlbELoGdpE7/quickstart
