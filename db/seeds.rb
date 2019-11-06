# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
kitten_list = [
  {
    name: 'kitten 1',
    description: 'kiitten #1',
    url: 'https://i.ytimg.com/vi/t9zUtvlhorU/hqdefault.jpg'
  },
  {
    name: 'kitten 2',
    description: 'kiitten #2',
    url: 'https://www.bestfunnies.com/wp-content/uploads/2015/07/Funny-Kitten-Pictures-13.jpg'
  },
  {
    name: 'kitten 3',
    description: 'kiitten #3',
    url: 'http://3.bp.blogspot.com/-Yjajt5fDJ-M/Tryf_L5Y_mI/AAAAAAAADMM/omdCehNs-cw/s1600/Cute-Funny-Kitten-01.jpg'
  },
  {
    name: 'kitten 4',
    description: 'kiitten #4',
    url: 'https://images.unsplash.com/photo-1560114928-40f1f1eb26a0?ixlib=rb-1.2.1&w=1000&q=80'
  },
  {
    name: 'kitten 5',
    description: 'kiitten #5',
    url: 'https://thewondrous.com/wp-content/uploads/2015/05/adorable-kittens.jpg'
  },
  {
    name: 'kitten 6',
    description: 'kiitten #6',
    url: 'http://www.luvbat.com/uploads/funny_kitten_bites_bed-board_1008621845.jpg'
  },
  {
    name: 'kitten 7',
    description: 'kiitten #7',
    url: 'https://pbs.twimg.com/profile_images/987951033576927232/zIwyyw_u_400x400.jpg'
  },
  {
    name: 'kitten 8',
    description: 'kiitten #8',
    url: 'https://i.ytimg.com/vi/7OmiJfVyo80/maxresdefault.jpg'
  },
  {
    name: 'kitten 9',
    description: 'kiitten #9',
    url: 'https://i.ebayimg.com/images/g/hAwAAOSwMmBVvCIb/s-l300.jpg'
  },
  {
    name: 'kitten 10',
    description: 'kiitten #10',
    url: 'https://www.bestfunnies.com/wp-content/uploads/2015/07/Funny-Kitten-Pictures-9.jpg'
  },
  {
    name: 'kitten 11',
    description: 'kiitten #11',
    url: 'https://thewondrous.com/wp-content/uploads/2015/05/cute-and-funny-kittens.jpg'
  },
  {
    name: 'kitten 12',
    description: 'kiitten #12',
    url: 'https://cache.desktopnexus.com/thumbseg/2016/2016666-bigthumbnail.jpg'
  },
  {
    name: 'kitten 13',
    description: 'kiitten #13',
    url: 'http://thuglifememe.com/wp-content/uploads/2019/06/a.jpg'
  },
  {
    name: 'kitten 14',
    description: 'kiitten #14',
    url: 'https://wallpaperaccess.com/full/256042.jpg'
  },
  {
    name: 'kitten 15',
    description: 'kiitten #15',
    url: 'https://upload.wikimedia.org/wikipedia/commons/f/f2/4_weeks_old_funny_kitten.jpg'
  },
  {
    name: 'kitten 16',
    description: 'kiitten #16',
    url: 'http://mabalakat.com/wp-content/uploads/2016/03/P1030507.jpg'
  },
  {
    name: 'kitten 17',
    description: 'kiitten #17',
    url: 'https://lh3.googleusercontent.com/m90PadM0JgLoWbD017faE18EJ_S4bVNikHUzn-moAUXK4dWORADfY-qQK4aJkmTDJUxdn4lO=w640-h400-e365'
  },
  {
    name: 'kitten 18',
    description: 'kiitten #18',
    url: 'https://cdn.pixabay.com/photo/2017/07/11/13/09/cute-2493496_960_720.jpg'
  },
  {
    name: 'kitten 19',
    description: 'kiitten #19',
    url: 'https://cdn.pixabay.com/photo/2019/01/04/14/43/cat-3913284_960_720.jpg'
  },
  {
    name: 'kitten 20',
    description: 'kiitten #20',
    url: 'https://www.colourbox.com/preview/3658030-funny-kitten.jpg'
  }
]

kitten_list.each do |kitten|
  Image.create!(kitten)
end
