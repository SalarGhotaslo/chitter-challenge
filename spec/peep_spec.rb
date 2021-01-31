require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Can you see this message?")
      expect(peeps).to include("This is another peep message")
    end
  end
end