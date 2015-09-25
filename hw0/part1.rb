def sum(array)
	sum = 0
	array.each {|elem| sum += elem}
	sum
end

puts "sum [1,2,5] == 8"
puts sum([1,2,5]) == 8
puts "sum [] == 0"
puts sum([]) == 0

def max_2_sum(array)
	sum(array.sort.last(2))
end

puts "max_2_sum [1,2,5] == 7"
puts max_2_sum([1,2,5]) == 7
puts "max_2_sum [2] == 2"
puts max_2_sum([2]) == 2
puts "max_2_sum [] == 0"
puts max_2_sum([]) == 0

def sum_to_n?(array, n)
	if array.empty? and n == 0 then return true end
	array.each_index do |first_index|
		second_index = first_index + 1
		while array[second_index] != nil
				if sum([array[first_index], array[second_index]]) == n
					return true
				end
				second_index+=1
		end
	end
	return false
end

puts "sum_to_n?([1,2,5], 3) == true"
puts sum_to_n?([1,2,5], 3) == true
puts "sum_to_n?([1,2,5], 4) == false"
puts sum_to_n?([1,2,5], 4) == false
puts "sum_to_n?([2] == 2) == false"
puts sum_to_n?([2],2) == false
puts "sum_to_n?([], 3) == false"
puts sum_to_n?([], 3) == false
puts "sum_to_n?([], 0) == true"
puts sum_to_n?([], 0) == true
