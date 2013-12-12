class ChangeColNameInJob < ActiveRecord::Migration
  def up
   rename_column :jobs, :desc, :descp
  end

  def down
   rename_column :jobs, :descp, :desc
  end
end
