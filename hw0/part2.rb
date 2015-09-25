def hello(name)
	"Hello, " + name
end

puts "hello('Nikos') == 'Hello, Nikos'"
puts hello("Nikos") == "Hello, Nikos"
puts "hello('') == 'Hello, '"
puts hello("") == "Hello, "

def starts_with_consonant?(s)
	s.match(/^[^aeiou\W]/i) != nil
end

puts starts_with_consonant?('sfre')
puts starts_with_consonant?('Sfsdfds')
puts starts_with_consonant?('afd')
puts starts_with_consonant?('!sfdgfd')

def binary_multiple_of_4?(s)
	if s.match(/[^01\s]/) != nil or s.empty? then return false end
	int = s.to_i(2)
	int % 4 == 0 and int != 0 
end

puts binary_multiple_of_4?("0010102")
puts binary_multiple_of_4?("1000")
puts binary_multiple_of_4?("1001")
