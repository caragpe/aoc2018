class MetadataChecksum

  def has_children?(data_array)
    return true if data_array[0] > 0
    false
  end

  def process_nodes(data)
    accumulated_checksum = 0
    while(data.length > 0)
      accumulated_checksum += process_children_nodes(data)
    end
    accumulated_checksum
  end

  def process_children_nodes(data)
    result = 0
    if has_children?(data)
      children_nodes = data[0]
      qty_metadata = data[1]
      trash_head = data.shift(2)
      (1..children_nodes).each do |x|
        result += process_children_nodes(data)
      end
      result += sum_of_metadata_values(data.slice(0,qty_metadata))
      trash_tail = data.shift(qty_metadata)
    else
      metadata_qty = data[1]
      metadata_value = sum_of_metadata_values(data.slice(2,metadata_qty))
      removed = data.shift(2 + metadata_qty)
      return metadata_value
    end
    result
  end

  def sum_of_metadata_values(data)
    data.reduce(0) do |total, n|
      total += n
    end
  end

  def to_array(input)
    input.split(' ').map(&:to_i)
  end
end

data = File.read('./data.txt')

@metadata_checksum = MetadataChecksum.new()

puts "Checksum result: #{@metadata_checksum.process_nodes(data.split(' ').map(&:to_i))}"