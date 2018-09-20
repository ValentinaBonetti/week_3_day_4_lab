require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN castings ON castings.star_id = stars.id WHERE movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|star| Star.new(star)}
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
  sql = "SELECT * FROM movies"
  values = []
  movies = SqlRunner.run(sql, values)
  return movies.map { |movie| Movie.new( movie ) }
end

def self.delete_all()
  sql = "DELETE FROM movies"
  values = []
  SqlRunner.run(sql, values)
end

def check_budget()
  sql = "SELECT fee FROM stars INNER JOIN castings ON castings.star_id = stars.id WHERE movie_id = $1"
values = [@id]
result = SqlRunner.run(sql, values)
fee_array = result.map {|fee_hash| fee_hash["fee"].to_i}
total = 0
for fee in fee_array
  total += fee
end
remaining_budget = @budget - total
return remaining_budget
end

def update()
sql = "UPDATE movies
  SET
  (
    title,
    genre,
    budget


  ) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
values = [@title, @genre, @budget, @id]
SqlRunner.run(sql, values)
end

end
