require "metadata_checksum"

describe MetadataChecksum do
  before do
    @check = MetadataChecksum.new()
  end
  describe ".to_array" do
    it "returns array version of string" do
      expect(@check.to_array('1 2 3 4 5')).to eql([1, 2, 3, 4, 5])
    end
  end
  describe ".sum_of_metadata_values" do
    it "returns sum (integer) of array values (integer) " do
      expect(@check.sum_of_metadata_values([1, 2, 3, 4, 5])).to eql(15)
    end
  end
  describe ".has_children?" do
    it "returns true if a parent node has one children" do
      expect(@check.has_children?([1, 1, 0, 1, 10, 11])).to be(true)
    end
    it "returns false if a node has no child" do
      expect(@check.has_children?([0, 2, 10, 11])).to be(false)
    end
  end
  describe ".process_children_nodes" do
    it "return metadata checksum of an empty node" do
      expect((@check.process_children_nodes([0, 2, 10, 12]))).to eq(22)
    end
    it "return metadata checksum of empty node whose parent has one child node" do
      expect((@check.process_children_nodes([1,1,0, 2, 10, 12,1]))).to eq(23)
    end
    it "return metadata checksum of empty nodes whose parent has two children nodes" do
      expect((@check.process_children_nodes([2,1,0, 2, 10, 12, 0, 1, 20,1]))).to eq(43)
    end
  end
end