class Guard

  def sleeping(data)
    45
  end

  def parseText(dataString)
    puts dataString
    data_in_lines = dataString.split('[').map(&:strip)
    data_in_lines.delete_if { |item| item.empty?}
    result = []
    data_in_lines.map do |data|
      temp_array = data.split(' ')
      date = temp_array[0]
      temp_time = temp_array[1].split(']')[0].split(':')
      time = 60*temp_time[0].to_i + temp_time[1].to_i      
      if (temp_array[2] == "Guard")
        guard_id = temp_array[3]
        action = 'begins'
      else
        guard_id = result[-1][2]
        action = temp_array[2] == 'falls'? 'asleep': 'wakes'
      end
      result << [date, time, guard_id, action]
    end
    result
  end

end

# data = File.read('../data.txt')

# @g = Guard.new()

# @g.sleeping