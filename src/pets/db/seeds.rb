# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  Add three examples

Cat.delete_all
#...
Cat.create(name: 'Shelly',
    breed:'American Bobtail',
    age: 1,
    gender: 'F',
    image_url: 'shelly.jpg',
  description:
    %{<p>
        My name is Shelly, and at 9 months of age, I'm still a kitten who is hoping to learn to trust and love kind people. I was lost when I arrived here. I'm enjoying being inside where I'm safe and warm and receiving affection. How I do hope a patient, gentle person like you will want to adopt me and help me learn all about the joys of being a kitty in a loving home!
      </p>})
#...

Cat.create(name: 'Sonja',
    breed:'Japanese Bobtail',
    age: 8,
    gender: 'F',
    image_url: 'sonja.jpg',
  description:
    %{<p>
I'm an unusually beautiful tabby with my orange accents and white feet and chest. Plus, I'm friendly and silky soft to the touch. My previous person could no longer take care of me, but I'm lucky to be waiting here for a new home where I will eagerly share my affection with you. My adoption includes my spay, vaccinations, a health check, and a microchip.
      </p>})
#...

Cat.create(name: 'Allie',
    breed:' Scottish Fold',
    age: 1,
    gender: 'F',
    image_url: 'allie.jpg',
  description:
    %{<p>
My name is Allie, and aren't I a beautiful kitten! I was only 5 months old when I got lost. I sure hope that you'll come find me here. I'd love to be your new best forever friend in your forever, indoor home. That way I'll be safe and yours for a lifetime. My adoption fee includes my spay surgery, a health check, vaccinations, and a microchip.
      </p>})
#...




