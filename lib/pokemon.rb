require 'pry'


class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(args)
    @id = args[:id] if args[:id]
    @name = args[:name] if args[:name]
    @type = args[:type] if args[:type]
    @db = args[:db] if args[:db]
  end

  # Pokemon.save("Pikachu", "electric", @db)
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

# Pokemon .find finds a pokemon from the database by their id number and returns a new Pokemon object
  def self.find(id, db)
    data = []
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    data = data[0]
    new(id: data[0], name: data[1], type: data[2], db: db)
  end
end

# Pry.start
