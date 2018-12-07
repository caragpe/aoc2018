class PolymerScanner
  
  def react(input)
    scan = 1
    while(scan >= 1)
      # puts "Input: #{input}"
      results_first = trigger_reaction(input)
      # puts "First result: #{results_first.inspect}"
      array_results = results_first[0].split('')
      # puts "Array_result: #{array_results.inspect}"
      first_char = array_results.shift() || ''
      # puts "Firs char for next iter #{first_char}"
      results_second = trigger_reaction(array_results.join())
      # puts "Firs char for next iter #{results_second}"
      input = first_char + results_second[0]
      # puts "Input: #{input}"
      scan = results_first[1] + results_second[1]
      # puts "Scan: #{scan}"
      # puts ""
    end
      
    # return results[0].strip()
    puts input.strip().length
  end

  def units_destroyed?(a, b)
    same_type_units(a, b) && opposite_polarity_units(a, b)
  end

  def same_type_units(a, b)
    a.upcase() == b.upcase()
  end

  def opposite_polarity_units(a, b)
    (a.upcase() == b && a != a.upcase()) || (a == b.upcase() && b != b.upcase())
  end

  def two_chars(input, position)
    unit_one = input[position]
    unit_two = input[position + 1]
    return [unit_one, unit_two]
  end

  def trigger_reaction(string)
    result = ''
    num_of_changes = 0
    input_array = string.split('')
    input_array.push(' ') if input_array.length % 2 !=0
    input_array.each_slice(2) do |x,y|
      if(units_destroyed?(x,y))
        # puts "2 units destroyed: #{x}#{y}"
        result += ''
        num_of_changes += 1
      else
        result += "#{x}#{y}"
      end
    end
    # puts [result, num_of_changes].inspect
    return [result, num_of_changes]
  end

end

data = File.read('../data.txt')

# @pol = PolymerScanner.new()

# @pol.react(data)
@letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

@letters.map do |letter|
  string = letter.upcase + letter
  puts 
  data_copy = data.gsub(/[#{string}]/,'')
  puts 
  @pol = PolymerScanner.new()
  puts "LETTER: #{letter.upcase} - Originally #{data.length} After gsub #{data_copy.length}"
  @pol.react(data_copy)
end