class Pokemon
  attr_accessor :id, :name, :type, :db, :sql_runner, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = (?);", id).flatten
    Pokemon.new(id: id, name: poke[1], type: poke[2], db: db, hp: poke[3])
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?);", hp, @id)
  end
end
