class Responder
  attr_reader :counter

  def initialize
    @counter = 0
  end
#instantiate Parser to get request_lines_to_pop_header/output
  def print_header
    header = ["http/1.1 200 ok"]
    # header
  end

  def print_output
    output = "Hello, World! (#{@counter})."
    "\n"+output
  end

  def count
    @counter += 1
  end
end
