require 'socket'

server = 'cherryh.freenode.net'
port = 6667
socket = TCPSocket.open(server, port)

nickname = 'SkillcrushBotOMG'
channel = '#turquoise1591'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"
socket.puts "JOIN #{channel}"

socket.puts "PRIVMSG #{channel} :I am so happy to be here!"

while message = socket.gets do
	puts message

	  if message.match('^PING :')
	  	server = message.split(':').last
	  	puts "PONG #{server}"
	  	socket.puts "PONG #{server}"
	  elsif message.match('How are you?')
	    puts "PRIVMSG #{channel} :I'm great, thanks!"
	    socket.puts "PRIVMSG #{channel} :I'm great, thanks!"
	  #elsif message.match('SuperAwesomeBot who is your BFF?')
	    #puts "PRIVMSG #{channel} :Sam!"
	    #socket.puts "PRIVMSG #{channel} :Sam!"
	  elsif message.match('SuperAwesomeBot I want to be your BFF!')
  		File.write('bff.txt', "#{channel}")
  		puts "PRIVMSG #{channel} :Gee thanks :)"
	    socket.puts "PRIVMSG #{channel} :Gee thanks :)"
	  elsif message.match('SuperAwesomeBot who is your BFF?')
  		puts "PRIVMSG #{channel} :My best friend is #{File.read('bff.txt')}"
  		socket.puts "PRIVMSG #{channel} :My best friend is #{File.read('bff.txt')}"
  	  elsif message.match('BFFBot I feel down, inspire me!')
	    puts "PRIVMSG #{channel} :It is during our darkest moments that we must focus to see the light. - Aristotle"
	    socket.puts "PRIVMSG #{channel} :It is during our darkest moments that we must focus to see the light. - Aristotle"	
	  end
end



	
