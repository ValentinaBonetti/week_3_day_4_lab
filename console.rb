require_relative("models/movie")
require_relative("models/star")
require_relative("models/casting")

require("pry")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({
  'title' => 'The God Father',
  'genre' => 'Crime'
  })

  movie1.save()

  movie2 = Movie.new({
    'title' => 'The God Father 2',
    'genre' => 'Crime'
    })
    movie2.save()

    star1 = Star.new({
      'first_name' => 'Marlon',
      'last_name' => 'Brando'
      })
star1.save()

star2 = Star.new({
  'first_name' => 'Al',
  'last_name' => 'Pacino'
  })

  star2.save()

  casting1 = Casting.new({
    'movie_id' => movie1.id,
    'star_id' => star1.id,
    'fee' => 10000
    })

    casting1.save()

binding.pry
nil
