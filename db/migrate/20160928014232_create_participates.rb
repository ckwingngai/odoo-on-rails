class CreateParticipates < ActiveRecord::Migration[5.0]
  def change
    create_table :participates do |t|
      t.integer :member_id
      t.integer :company_id
      t.string :status

      t.timestamps
    end
  end
end
