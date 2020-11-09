require 'pg'

class Peep
  def self.all
    connection = self.connect
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end
  
  private
  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
