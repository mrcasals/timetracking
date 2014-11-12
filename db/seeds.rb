# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

12.times do |index|
  project = Project.create name: "Project #{index + 1}",
  description: "Description for project #{index + 1}"

  Entry.create hours: index + 1, minutes: index + 1, date: Date.today, project_id: project.id
end
