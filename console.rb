require_relative("models/movie")
require_relative("models/star")
require_relative("models/casting")

require("pry")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({
  'title' => 'The God Father',
  'genre' => 'Crime',
  'budget' => 1000000
  })

  movie1.save()

  movie2 = Movie.new({
    'title' => 'The God Father 2',
    'genre' => 'Crime',
    'budget' => 3000000
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

  star3 = Star.new({
    'first_name' => 'Steve',
    'last_name' => 'person'
    })
    star3.save()

    star4 = Star.new({
      'first_name' => 'Colin',
      'last_name' => 'person'
      })

    star4.save()

  casting1 = Casting.new({
    'movie_id' => movie1.id,
    'star_id' => star1.id,
    'fee' => 10000
    })

    casting1.save()

    casting2 = Casting.new({
      'movie_id' => movie1.id,
      'star_id' => star2.id,
      'fee' => 10000
      })

      casting2.save()

        casting3 = Casting.new({
          'movie_id' => movie1.id,
          'star_id' => star3.id,
          'fee' => 10000
          })

          casting3.save

          casting4 = Casting.new({
            'movie_id' => movie1.id,
            'star_id' => star4.id,
            'fee' => 10000
            })

            casting4.save

binding.pry
nil
