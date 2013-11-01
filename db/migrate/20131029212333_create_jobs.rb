class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :employer #email of the user class
      t.string :title #job title
      t.text :desc #brief job description
      t.text :reqs #job requirements
      t.text :desire # desired but NOT required qualification
      t.timestamps 
    end
  end
end
