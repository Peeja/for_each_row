module ForEachRow
  # Example:
  # for_each_row <<-TABLE do |number1, number2, sum|
  #                          |1,       2,       3  |
  #                          |5,       7,       12 |
  #                 TABLE
  #   (number2 + number2).should == sum
  # end
  
  def for_each_row(table)
    table.split("\n").each do |line|
      if line.strip =~ /^\|(.*)\|$/
        items = $1.split(",").map { |item| item.strip }
        yield *items
      end
    end
  end
end
