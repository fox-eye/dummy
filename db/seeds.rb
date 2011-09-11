# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create ads categories and subcategories

require 'faker'

def random_in_range(min,max)
  min = min.to_i
  max = max.to_i
  arr = (min..max).to_a;
  arr.at(rand(arr.length))
end


categories = {
              "musical instruments" => ["string instruments","electric string instruments","wind instrument","percussion instrument"],
              "hi-fi equipment" => ["digital video recorders","dvd players","blu-ray players","radio","tv's"],
              "video games" => ["portable video game system","home game console","games all platforms"],
              "clothes" => ["t-shirts","skirts","dresses","coats","hats","man pants","women pants","man sweaters","women sweaters"],
              "vehicles" => ["cars","motorbikes","bicycles","vans","trucks"]
        }
          

categories.each do |category_name,subcat|
  category = Category.create(:name => category_name)
  subcat.each do |subcat_name|
    category.children.create(:name => subcat_name)
  end
end

# Let's create some ads ...

Category.roots.each do |root_category|
  
  subcategories = root_category.children[0..2]
  
  subcategories.each do |subcategory|
    5.times do
      subcategory.ads.create({
                          :title => Faker::Lorem.words(random_in_range(4,10)),
                          :description => Faker::Lorem.sentences(random_in_range(1,3))
                          })  
    end
  end
  
end

