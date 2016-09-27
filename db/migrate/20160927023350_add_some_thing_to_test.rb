class AddSomeThingToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :some_thing, :string
  end
end
