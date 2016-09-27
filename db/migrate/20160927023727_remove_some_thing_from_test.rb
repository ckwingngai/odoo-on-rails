class RemoveSomeThingFromTest < ActiveRecord::Migration[5.0]
  def change
    remove_column :tests, :some_thing, :string
  end
end
