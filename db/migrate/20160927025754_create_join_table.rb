class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tests, :products do |t|
      t.index [:test_id, :product_id]
      t.index [:product_id, :test_id]
    end
  end
end
