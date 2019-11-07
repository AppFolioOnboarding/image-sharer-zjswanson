# This will guess the User class
FactoryBot.define do
  factory :image do
    name { 'John' }
    description { 'A Kitten' }
    url do
      'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    end
    tag_list { 'tag1 , tag 2' }
  end
end
