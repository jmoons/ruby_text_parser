unless ARGV[0]
  puts "You must supply a file to parse as the first argument"
  exit
end

unless File.exist?( ARGV[0] )
  puts "#{ARGV[0]} is not a valid file"
  exit
end

input_file = File.open( ARGV[0], "r" )
input_file.each_line do | line |
  puts line
end
input_file.close
