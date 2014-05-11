require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "pet must have name age and species" do
    pet = Pet.new
    assert pet.invalid?
    assert pet.errors[:name].any?
    assert pet.errors[:age].any?
    assert pet.errors[:species].any?
  end

  test "pet must have positive age" do
    pet = Pet.new(name: "Placeholder",
                  age: -1,
                  species: "Placeholder",
                  breed: "Placeholder",
                  habits: "Placeholder",
                  image_url: "Placeholder.png")

    assert pet.invalid?
    assert_equal ["must be greater than or equal to 0"], pet.errors[:age]

    pet.age = 0
    assert pet.valid?

    pet.age = 1
    assert pet.valid?
  end

  test "pet image url must be valid" do
    pet = Pet.new(name: "Placeholder1",
                  age: 2,
                  species: "Placeholder",
                  breed: "Placeholder",
                  habits: "Placeholder")

    assert pet.invalid?
    assert_equal ['must be a URL for GIF, JPG or PNG image'], pet.errors[:image_url]

    pet.image_url = 'some_img.PNG'
    assert pet.valid?

    pet.image_url = 'some_img.png'
    assert pet.valid?
  end
end
