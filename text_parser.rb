PUNCTUATION = /[!?.,:;(){}'"\[\]]/

unless ARGV[0]
  puts "You must supply a file to parse as the first argument"
  exit
end

unless File.exist?( ARGV[0] )
  puts "#{ARGV[0]} is not a valid file"
  exit
end

word_hash = {}

input_file = File.open( ARGV[0], "r" )
input_file.each_line do | line |
  trimed_line_array = line.chomp.gsub(PUNCTUATION, "").split(" ")

  trimed_line_array.each do | word |
    word = word.downcase
    if word_hash[word]
      word_hash[word] += 1
    else
      word_hash[word] = 1
    end
  end

end
input_file.close

puts word_hash.sort_by{|word, word_count| word_count}.inspect
puts "Word Count: #{word_hash.values.inject(0, :+)}"
puts "Total Unique Words: #{word_hash.keys.length}"