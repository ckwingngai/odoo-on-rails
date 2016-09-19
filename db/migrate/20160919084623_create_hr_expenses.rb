class CreateHrExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :hr_expenses do |t|
      t.string :db
      t.integer :ref_id
      t.string :action
      t.string :post_json
      t.string :remarks

      t.timestamps
    end
  end
end
