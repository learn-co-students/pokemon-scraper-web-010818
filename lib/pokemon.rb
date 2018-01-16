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

  def self.find(id, db)
    data = []
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    db_id = data[0]
    db_name = data[1]
    db_type = data[2]
    db_hp = data[3]
    new(id: db_id, name: db_name, type: db_type, db: db, hp: db_hp)
  end

  def alter_hp(new_value, db)
    db.execute("UPDATE pokemon SET hp = ?;",new_value)
  end
end
