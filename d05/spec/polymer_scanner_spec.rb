require "polymer_scanner"

describe PolymerScanner do
  describe ".react" do
    before do
      @pol = PolymerScanner.new()
    end
    context "given a two-letter string" do
      it "returns an empty string when having 'aA' units" do
        expect(@pol.react("aA")).to eql("")
      end
      it "returns 'AA' string when having 'AA' units" do
        expect(@pol.react("AA")).to eql("AA")
      end
    end
    context "given a 4-letter string" do
      it "returns an empty string when having 'abBA' units" do
        expect(@pol.react("abBA")).to eql("")
      end
      it "returns 'abAB' string when having 'abAB' units" do
        expect(@pol.react("abAB")).to eql("abAB")
      end
      it "returns 'abABab' string when having 'abABab' units" do
        expect(@pol.react("abABabC")).to eql("abABabC")
      end
    end
    context "given a large string" do
      it "returns 'dabCBAcaDA' string when having 'dabAcCaCBAcCcaDA ' units" do
        expect(@pol.react("dabAcCaCBAcCcaDA")).to eql("dabCBAcaDA")
      end
    end
  end
end