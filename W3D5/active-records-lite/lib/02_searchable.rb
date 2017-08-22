require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    #haskell_cats = Cat.where(:name => "Haskell", :color => "calico")
    p where_line = params.keys.map {|key| "#{key} = ?"}.join(" AND ")
    p params.values
    results = DBConnection.execute(<<-SQL, *params.values)
    SELECT
      *
    FROM
      #{table_name}
    WHERE
      #{where_line}
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
