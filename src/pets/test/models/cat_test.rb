require 'test_helper'
#test empty, age is integer and positive, gender is F or M, and image_url
class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "cats' attributes must not be empty" do
    cat = Cat.new
    assert cat.invalid?
    assert cat.errors[:name].any?
    assert cat.errors[:breed].any?
    assert cat.errors[:gender].any?
    assert cat.errors[:description].any?
    assert cat.errors[:age].any?
    assert cat.errors[:image_url].any?
end

  test "cat age must be positive & integer" do
    cat = Cat.new(name:       "kitty",
            breed: "Dersd",
            gender:"F",
            description: "yyy",
            image_url:   "xxx.jpg")
    cat.age = -1
    assert cat.invalid?
    assert_equal ["must be greater than or equal to 0"],
      cat.errors[:age]

    cat.age = 0.1
    assert cat.invalid?
    assert_not_equal ["must be an integer number"],
    cat.errors[:age]

    cat.age = 1
    assert cat.valid?
  end

    test "cat gender must be in {F, M}" do
    cat = Cat.new(name:       "kitty",
            breed: "Dersd",
            age:1,
            description: "yyy",
            image_url:   "xxx.jpg")
    cat.gender = 'Dir'
    assert cat.invalid?
    assert_not_equal ["must be valid chractor M(ale) or F(emale)"],
      cat.errors[:gender]

    cat.gender = 'W'
    assert cat.invalid?
    assert_not_equal ["must be valid chractor M(ale) or F(emale)"],
    cat.errors[:gender]

    cat.gender = 'M'
    assert cat.valid?
  end

  def new_cat(image_url)
    Cat.new(name:       "kitty",
            breed: "Dersd",
            gender:"F",
            description: "yyy",
            age: 1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ coat.gif coat.jpg coat.png COAT.JPG COAT.Jpg
             http://a.b.c/x/y/z/coat.gif }
    bad = %w{ coat.doc coat.gif/more coat.gif.more }
    ok.each do |name|
      assert new_cat(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_cat(name).invalid?, "#{name} shouldn't be valid"
    end
  end


end
