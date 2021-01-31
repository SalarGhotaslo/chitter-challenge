require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    connection.exec("SELECT * FROM peeps;")
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| peeps['peep'] }
  end
end