class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_table :tests do |t|
      t.change :part_number, :text
    end
  end
end
