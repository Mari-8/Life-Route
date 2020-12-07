class ChangeDeadlineToString < ActiveRecord::Migration
  def change
    change_column :goals, :deadline, :string
  end
end
