require 'peep'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is also a peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Along with this being a peep');")

      peeps = Peep.all

      expect(peeps).to include("This is a peep")
      expect(peeps).to include("This is also a peep")
      expect(peeps).to include("Along with this being a peep")
    end
  end
end
