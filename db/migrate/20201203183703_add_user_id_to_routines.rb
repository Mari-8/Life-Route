class AddUserIdToRoutines < ActiveRecord::Migration
  def change
    add_column :routines, :user_id, :integer
  end
end
