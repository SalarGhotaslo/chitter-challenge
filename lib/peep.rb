require 'pg'

class Peep
    attr_reader :id, :message, :time

    def initialize(id:, message:, time:)
      @id = id
      @message = message
      @time = time
    end
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| peeps['peep'] 
        Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])}
  end
  def self.create(message)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}')")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
     end
  end
end