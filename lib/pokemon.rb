require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten

    self.new(id:found_pokemon[0], name:found_pokemon[1], type:found_pokemon[2], db:db)
  end

  def self.all
    @@all
  end
end
