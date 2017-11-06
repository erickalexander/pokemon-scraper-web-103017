require 'pry'
class Pokemon
  attr_reader :id, :name, :type
  attr_accessor :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name, type, db) #Pokemon.save
    db.execute("INSERT INTO pokemon (name,type) VALUES ('#{name}','#{type}');")
  end

  def self.find(id,db)
    pokemon = {}
    pokemon[:name] = db.execute("SELECT name FROM pokemon WHERE id ='#{id}'")[0][0]
    pokemon[:type] = db.execute("SELECT type FROM pokemon WHERE id ='#{id}'")[0][0]
    pokemon[:id] = db.execute("SELECT id FROM pokemon WHERE id ='#{id}'")[0][0]
    pokemon[:db] = db
    Pokemon.new(pokemon)
  end

end


# def initialize(id:, name:, type:, db:)
# Pokemon.new({id: 1, name: "Meryl", type: "Water", db: "db"})
#
#
#
# def initialize(id, name, type, db)
# Pokemon.new(1, "Meryl", "Water", "db")
