class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  attr_reader :all

  @@all = []

  def initialize(id:nil, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

    @@all << self
  end

  def self.save(name, type, db)

    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)

    #inserts into database
  end

  def self.find(id, db)
    found = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    found = found.first

    new = self.new(id: found[0], name: found[1], type: found[2], db: db, hp: found[3])
  end

  def alter_hp(hp, db)

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
