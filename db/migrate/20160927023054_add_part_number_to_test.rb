class AddPartNumberToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :part_number, :string
  end
end
