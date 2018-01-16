require "pry"

class Pokemon

  attr_accessor :db, :name, :type, :id, :hp

  @@all = []

  def initialize(name)
    @name = name[:name]
    @type = name[:type]
    @id = name[:id]
    @db = name[:db]
    @hp = name[:hp]
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", [name, type])
  end

  def self.find(pokemon_id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{pokemon_id}").flatten
    name = {}
    name[:name] = pokemon[1]
    name[:type] = pokemon[2]
    name[:id] = pokemon[0]
    name[:hp] = pokemon[3]
    Pokemon.new(name)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end

end
