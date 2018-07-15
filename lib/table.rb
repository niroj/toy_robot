# Responsible for the table
#
# Author:: Niroj Shrstha (mailto:nexus.niroj@gmail.com)
#
class Table
  attr_reader :row, :column

  def initialize(row = 5, column = 5)
    @row = row.to_i
    @column = column.to_i
  end

  def is_valid_coordinates?(x, y)
    !x.negative? && x < row && !y.negative? && y < column
  end
end
