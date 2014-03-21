require 'csv'
require 'english'

csv_fname = 'book.csv'
people = Array.new
class Person <
        Struct.new(:name, :times, :total, :title)
    
end

CSV.foreach(csv_fname, converters: :numeric) do |row|
    p = Person.new
    p.name = row[0]
    p.times = row[1]
    p.total = row[2]
    p.title = row[3]
    people.push(p)
end

people = people.sort_by { |a| [ a.times] }
people.each { |p|
  puts p.times
}