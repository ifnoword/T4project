class DropEmFromJob < ActiveRecord::Migration
  def up
    remove_column :jobs, :employer
  end
  def down
    add_column :jobs, :employer, :string
  end
end
