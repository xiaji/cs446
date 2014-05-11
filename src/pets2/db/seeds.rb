# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Pet.delete_all
Pet.create!(name: "Tenshi",
            age: 8,
            species: "Dog",
            breed: "Dachshund",
            image_url: "Tenshi.png",
            habits: "Eating birds, Licking faces, Snuggling",
            status: "available")

Pet.create!(name: "Autym",
            age: 18,
            species: "Dog",
            breed: "Dachshund",
            image_url: "Autym.png",
            habits: "Licking",
            status: "fostered")

Pet.create!(name: "Kurly",
            age: 7,
            species: "Dog",
            breed: "Dachshund",
            image_url: "Kurly.png",
            habits: "Barking, Stealing food",
            status: "available")

Pet.create!(name: "Bernie",
            age: 8,
            species: "Dog",
            breed: "Dachshund",
            image_url: "Bernie.png",
            habits: "Yelping, Jumping on people's laps",
            status: "available")

Pet.create!(name: "Tucker",
            age: 5,
            species: "Cat",
            breed: "Unknown",
            image_url: "Tucker.png",
            habits: "Meowing really loud, stepping on laptops",
            status: "available")

Pet.create!(name: "Gaspar",
            age: 2,
            species: "Cat",
            breed: "Unknown",
            image_url: "Gaspar.png",
            habits: "Running and jumping, shredding cloth",
            status: "available")

Pet.create!(name: "Azlan",
            age: 1,
            species: "Cat",
            breed: "Unknown",
            image_url: "Azlan.png",
            habits: "Making little meowing noises, messing with Gaspar",
            status: "available")