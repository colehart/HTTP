Dir["./lib/*.rb"].each { |file| require file }

Server.new(9292).run
