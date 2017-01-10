# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

Course.delete_all
JSON.parse(open("#{Rails.root}/db/course.json").read).each do |d|
    course = Course.new
    course.name = d['name']
    course.unique_id = d['id']
    course.code = d['code']
    course.description = d['description']
    course.credits = d['credits'].to_i
    course.subject = d['subjects'][0]['id']

    course.save
end

Instructor.delete_all
JSON.parse(open("#{Rails.root}/db/instructor.json").read).each do |d|
    instructor = Instructor.new
    instructor.middle = d['middle']
    instructor.unique_id = d['id'].to_i
    instructor.last = d['last']
    instructor.first = d['first']
    instructor.email = d['email']
    instructor.save
end

Subject.delete_all
JSON.parse(open("#{Rails.root}/db/subject.json").read).each do |d|
    subject = Subject.new
    subject.name = d['name']
    subject.unique_id = d['id']
    subject.abbr = d['abbreviation']
    subject.save
end
