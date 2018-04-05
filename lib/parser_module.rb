module Parser
  attr_reader :request_lines,
              :hello_counter,
              :total_counter
              
  def determine_response(path)
    if path == "/"
      default_response
    elsif path == "/hello"
      count_hello
      "Hello, World! (#{@hello_counter})."
    elsif path == "/datetime"
      "#{Time.now.strftime('%I:%M%p on %A, %B%e, %Y')}"
    elsif path == "/shutdown"
      "Total Requests: #{@total_counter})"
    end
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

  def count_hello
    @hello_counter += 1
  end

  def count_total
    @total_counter += 1
  end
end
