class ChangeDeadlineToDate < ActiveRecord::Migration
  def change
    change_column :goals, :deadline, :date
  end
end
