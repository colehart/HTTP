Dir["./lib/*.rb"].each { |file| require file }

Receiver.new(9292).start
