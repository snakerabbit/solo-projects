require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

    column_array = []

    # cols.first.each do |c|
    #   column_array << c.to_sym
    # end

    @columns = cols.first.map{|col| col.to_sym}

  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self.to_s.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end
#cat = Cat.new(name: "Gizmo", owner_id: 123)
#cat.name = "Gizmo"
#cat.owner_id = 123

  def initialize(params = {})
    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)

      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}

  end

  def attribute_values

  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
