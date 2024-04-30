class Calculator
  attr_reader :arr_str
  def initialize(*str)
    @arr_str = str.join.split(", \"").map{|str| str.gsub("\"", "").gsub("\\n", ",")}
  end

  def add
    begin
      new_arr = []
      @arr_str.each do |str|
        delimeter = ","
        if str[0..1] == "//"
          delimeter = str[2]
          str.slice!(0..3)
        end

        raise "Invalid character at the end string" if str[-1] == ','

        formatted_values = str.split(delimeter).map(&:to_i)

        negative_value = formatted_values.find{|value| !value.positive?}

        raise "Negative numbers not allowed #{negative_value}" unless negative_value.nil?

        new_arr << formatted_values.sum
      end
      new_arr.join(', ')
    rescue => error
      error.message
    end
  end
end
