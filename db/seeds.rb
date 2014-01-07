# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8

user1 = User.create!(username: "Alice", email: 'alive@alice.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user2 = User.create!(username: "Bob", email: 'bob@bob.com', :password => 'topsecret', :password_confirmation => 'topsecret')
project1 = Project.create(name: "Rails-Kurs")
project2 = Project.create(name: "Startup")
user1.tasks.create(name: "Todo-Applikation", deadline: Date.today + 7.days, duration: 2, done: false, delegated_id: user2.id, project_id: project1.id)
user2.tasks.create(name: "Idee für eigene Web-Applikation", deadline: Date.today + 10.days, duration: 2, done: false, project_id: project2.id)
user1.tasks.create(name: "Rails for Zombies", deadline: Date.today - 2.days, duration: 3, done: false, delegated_id: user2.id)
user2.tasks.create(name: "Übung 6: Rails Account", deadline: Date.today - 4.days, duration: 3, done: false, project_id: project1.id)
user1.tasks.create(name: "Übung 1: FizzBuzz", deadline: Date.today - 26.days, duration: 4, done: true, project_id: project1.id)
user2.tasks.create(name: "Übung 2: Ruby Konto", deadline: Date.today - 20.days, duration: 5, done: true, delegated_id: user1.id)