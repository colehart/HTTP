module Parser
  attr_reader :request_lines

  def determine_response(path)
    possible_responses = {
      "/": default_response,
      "/hello": hello_response,
      "/datetime": datetime_response,
      "/shutdown": shutdown_response
    }
    possible_responses[path.to_sym]
  end

  def default_response
    request_words = @request_lines.map do |line|
      line.split(' ')
    end
    """
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

  def hello_response
    "Hello, World! (#{@hello_counter})."
  end

  def count_hello
    @hello_counter += 1
  end

  def datetime_response
    "#{Time.now.strftime('%I:%M%p on %A, %B%e, %Y')}"
  end

  def shutdown_response
    "Total Requests: #{@total_counter}"
  end

  def count_total
    @total_counter += 1
  end
end
