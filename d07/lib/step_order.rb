class StepOrder

  def extract(phrase)
    phrase_to_a = phrase.split(' ')
    return [phrase_to_a[1], phrase_to_a[7]]
  end
end