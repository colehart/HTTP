module Parser
  attr_reader :request_lines

  def validate(path)
    possible_paths = ["/", "/hello", "/datetime", "/shutdown"]
    possible_paths.any? { |word| word == path } ? path : enter_valid_path
  end

  def enter_valid_path
    print "enter valid path >>"
    path = gets.chomp
    validate(path)
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
