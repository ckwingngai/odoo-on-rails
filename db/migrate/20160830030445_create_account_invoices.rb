class CreateAccountInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :account_invoices do |t|
      t.integer :ref_id
      t.string :action
      t.string :remarks

      t.timestamps
    end
  end
end
