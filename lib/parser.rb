class Parser
  attr_reader :request_lines

  def initialize
    @request_lines = []
  end

  def parse_lines
    response = "<pre>" + @request_lines.join("\n") + "</pre>"
  end

  def default_lines
    """
    <pre>
    Verb: POST
    Path: /
    Protocol: HTTP/1.1
    Host: 127.0.0.1
    Port: 9292
    Origin: 127.0.0.1
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    </pre>
    """
  end
end
