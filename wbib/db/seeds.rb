# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topicsArr = Array.new

6.times do |i|
    topicsArr[i] = Topic.create(title: "Topic #{i}", description: "Description for topic #{i}")
end

topicsArr.each do |t|
    3.times do |i|
        Reference.create(topic_id: t.id, url: "example.ExampleUrl#{i}.com")
    end
end