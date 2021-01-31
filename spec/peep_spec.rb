require 'peep'
  describe '.all' do
    it 'returns a list of peeps' do
connection = PG.connect(dbname: 'chitter_test')

# Add the test data
connection.exec("INSERT INTO peeps (peep) VALUES ('Hello, this is my first peep');")
peeps = Peep.all
      expect(peeps).to include("Hello, this is my first peep")
    end
  end