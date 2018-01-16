require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
    @id = args[:id] if args[:id]
    @name = args[:name] if args[:name]
    @type = args[:type] if args[:type]
    @db = args[:db] if args[:db]
    @hp = args[:hp] if args[:hp]

    self.class.save(@name, @type, @db)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
  end

  # Pokemon .find finds a pokemon from the database by their id number and returns a new Pokemon object
  def self.find(id, db)
    data = []
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_id = data[0]
    new_name = data[1]
    new_type = data[2]
    new_hp = data[3]
    new(id: new_id, name: new_name, type: new_type, db: db, hp: new_hp)
  end

  def alter_hp(new_value, db)
    db.execute("UPDATE pokemon SET hp = ?;",new_value)
  end
end

# Pry.start
