class Calculator
  attr_reader :arr_str
  def initialize(*str)
    @arr_str = str.join.split(", \"").map{|str| str.gsub("\"", "").gsub("\\n", ",")}
  end

  def add
    new_arr = []
    @arr_str.each do |str|
      new_arr << str.split(',').map(&:to_i).sum
    end
    new_arr.join(', ')
  end
end