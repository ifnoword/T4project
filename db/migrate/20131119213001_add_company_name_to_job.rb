class AddCompanyNameToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :companyname, :string
  end
end
