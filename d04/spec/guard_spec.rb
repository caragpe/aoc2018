require "guard"

describe Guard do
  before do
    @g = Guard.new()
    @guard10 =  %q(
      [1518-11-01 00:00] Guard #10 begins shift
      [1518-11-01 00:05] falls asleep
      [1518-11-01 00:25] wakes up
      [1518-11-01 00:30] falls asleep
      [1518-11-01 00:55] wakes up'
    )
    
    @guard99 = %q(
    [1518-11-01 23:58] Guard #99 begins shift
    [1518-11-02 00:40] falls asleep
    [1518-11-02 00:50] wakes up
    )
  end

  describe '.sleep' do
    expect(@guard10.sleeping).to eq(50)
  end

end