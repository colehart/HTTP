class Parser
  attr_reader :request_lines,
              :response

  def initialize
    @request_lines = []
    @response = ""
  end

  def parse_lines
    request_words = @request_lines.map do |line|
      line.split(' ')
    end

    @response = """
    <pre>
    Verb: #{request_words[0][0]}
    Path: #{request_words[0][1]}
    Protocol: #{request_words[0][2]}
    Host: #{request_words[1][1].split(':')[0]}
    Port: #{request_words[1][1].split(':')[1]}
    Origin: #{request_words[1][1].split(':')[0]}
    Accept: #{request_words[6][1]}
    </pre>
    """
  end
end
