require_relative("../db/sql_runner")

class Star

  def intialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = optiosn['last_name']
  end

end
