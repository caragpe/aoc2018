require "guard"

describe Guard do
  before do
    @g = Guard.new()
    @guard10 =  %q(
      [1518-11-01 00:00] Guard #10 begins shift
      [1518-11-01 00:05] falls asleep
      [1518-11-01 00:25] wakes up
      [1518-11-01 00:30] falls asleep
      [1518-11-01 00:55] wakes up)

    @guard10Parsed = [
      ['1518-11-01', 0, '#10', 'begins'],
      ['1518-11-01', 5, '#10','asleep'],
      ['1518-11-01', 25, '#10','wakes'],
      ['1518-11-01', 30, '#10','asleep'],
      ['1518-11-01', 55, '#10','wakes']
    ]
    
    @guard99 = %q(
    [1518-11-01 23:58] Guard #99 begins shift
    [1518-11-02 00:40] falls asleep
    [1518-11-02 00:50] wakes up)

    @guard99Parsed = [
      ['1518-11-01', 1438, '#99', 'begins'],
      ['1518-11-02', 40, '#99', 'asleep'],
      ['1518-11-02', 50, '#99', 'wakes']
    ]
  end

  describe '.parseText' do
    it('Guard 10 data parsed') do
      expect(@g.parseText(@guard10)). to eq(@guard10Parsed)
    end
  end

  describe '.sleep' do
    it('Guard 10 sleeps for 50 min') do
      expect(@g.sleeping(@guard10)).to eq(45)
    end
    it('Guard 99 sleeps for 50 min') do
      expect(@g.sleeping(@guard99)).to eq(5)
    end
  end

end