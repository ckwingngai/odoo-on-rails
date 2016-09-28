class AddVerifyCodeToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :verify_code, :integer
  end
end
