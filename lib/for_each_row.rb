module ForEachRow
  # Example:
  # for_each_row <<-TABLE do |number1, number2, sum|
  #                          |1,       2,       3  |
  #                          |5,       7,       12 |
  #                 TABLE
  #   (number2 + number2).should == sum
  # end
  
  def for_each_row(table, &block)
    table.split("\n").each do |row|
      if row.strip =~ /^\|(.*)\|$/
        cell_values = $1.split(",").map { |cell| eval(cell, block) }
        block.call *cell_values
      end
    end
  end
end
