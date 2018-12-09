class MetadataChecksum

  def checksum_of_string(input)
    data_array = input.split(' ').map(&:to_i)
    sum(data_array)
  end

  def has_children?(data_array)
    return true if data_array[0] > 0
    false
  end

  def process_children_nodes(data)
    if has_children?(data)
      children_nodes = data[0]
      qty_metadata = data[1]
      result = sum_of_metadata_values(data[data.size - qty_metadata, data.size])
      trash_head = data.shift(2)
      trash_tail = data.pop(qty_metadata)
      (1..children_nodes).each do |x|
        result += process_children_nodes(data)
      end
    else
      metadata_qty = data[1]
      metadata_value = sum_of_metadata_values(data[2,metadata_qty])
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