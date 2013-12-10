# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#jobs = [ { :employer => 'PaperG', :title => 'Soft. Eng.', :desc => 'G' , :reqs => '25-Nov-1992' , :desire => 'wwwww'}
#  ]

 
# jobs.each do |job|
# Job.create(job)

users = [ { :email => 'test@test.com', :name => 'Test', :password_digest => 'testtest'}
  ]

  users.each do |user|
  User.create(user)
end
