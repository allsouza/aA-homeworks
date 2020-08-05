require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    result = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT * 
      FROM plays 
      WHERE title = ?
    SQL
    return nil if result.length < 1
    Play.new(result.first)
  end

  def self.find_by_playwright(q_name)
    id = Playwright.find_by_name(q_name)
    raise "#{q_name} not in the database!" unless id
    result = PlayDBConnection.instance.execute(<<-SQL, id.id)
      SELECT 
        *
      FROM
        plays
        JOIN playwrights ON
          plays.playwright_id = playwrights.id
      WHERE
        playwrights.id LIKE ?
    SQL
    result.map { |play| Play.new(play) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |ele| Playwright.new(ele) }
  end

  def self.find_by_name(a_name)
    result = PlayDBConnection.instance.execute(<<-SQL, a_name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name LIKE ?
    SQL
    raise "#{a_name} is not in the database" unless result
    Playwright.new(result.first)
  end

  attr_accessor :id, :name, :birth_year

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} is already in DB" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights(name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} does not exist in DB" if self.id.nil?
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless self.id
    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end


end
