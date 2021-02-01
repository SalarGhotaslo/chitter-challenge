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
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'new peep inserted')
      Peep.create('Testing new peep')
      peeps = Peep.all
      expect(peeps.first.message).to eq 'Testing new peep'
    end
  end