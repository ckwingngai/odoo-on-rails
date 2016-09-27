class DropCompaniesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
