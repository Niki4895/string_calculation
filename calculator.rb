class Calculator
  attr_reader :arr_str
  def initialize(*str)
    @arr_str = str.join.split(", \"").map{|str| str.gsub("\"", "")}
  end
end