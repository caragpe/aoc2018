require "step_order"

describe StepOrder do
  describe ".order" do
    before do
      @step = StepOrder.new()
    end
    context "Given a step" do
      it "returns two steps 'KG' when 'Step K must be finished before step G can begin.'" do
        expect(@step.extract('Step K must be finished before step G can begin.')).to eq(["K","G"])
      end
    end
  end
end