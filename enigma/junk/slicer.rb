class Slicer
  attr_reader :unsliced

  def load_text(string)
    @unsliced = string
  end

  def chopper
    chopped_message = []
    @unsliced.chars.each_slice(4) { |slice| chopped_message << slice.join }
    return chopped_message
  end

end
