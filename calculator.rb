class Calculator
  attr_reader :arr_str
  def initialize(*str)
    @arr_str = str.join.split(", \"").map{|str| str.gsub("\"", "").gsub("\\n", ",")}
  end

  def add
    new_arr = []
    @arr_str.each do |str|
      delimeter = ","
      if str[0..1] == "//"
        delimeter = str[2]
        str.slice!(0..3)
      end
      new_arr << str.split(delimeter).map(&:to_i).sum
    end
    new_arr.join(', ')
  end
end