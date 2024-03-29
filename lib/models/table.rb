# Responsible for the table, and its constraints
#
# Author:: Niroj Shrstha (mailto:nexus.niroj@gmail.com)
#
class Table
  attr_reader :row, :column

  def initialize(row: nil, column: nil)
    @row = (row || 5).to_i
    @column = (column || 5).to_i
  end

  # checks if give coordinate is within the constraints of table
  # Params:
  # +x+:: position in x axis
  # +y+:: position in y axis
  def is_valid_coordinates?(x, y)
    x = x.to_i
    y = y.to_i
    !x.negative? && x < row && !y.negative? && y < column
  end
end
