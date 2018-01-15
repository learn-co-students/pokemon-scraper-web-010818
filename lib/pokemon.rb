class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) values (?, ?, ?)", [@id, name, type])
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon = array.first
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end

  def alter_hp(hp_value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_value, self.id)
  end

end
