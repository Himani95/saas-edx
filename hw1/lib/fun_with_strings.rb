module FunWithStrings
  def palindrome?
    self.gsub(/\W/,'').downcase == self.gsub(/\W/,'').downcase.reverse
  end
  def count_words
    dic = Hash.new
		self.downcase.gsub(/[^a-z\s]/,'').split.each do |word|
			if dic[word] != nil
				dic[word] += 1
			else
				dic[word] = 1
			end
		end
		dic
  end
  def anagram_groups
    words = self.split
		results = Array.new
		words.each_with_index do |word, index|
			unless results.any? { |arr| arr.include?(word) }
				temp_array = Array.new
				temp_array.push(word)
				words[index+1..-1].each do |word2|
					if word.is_anagram(word2)
						temp_array.push(word2)
					end
				end
				results.push(temp_array)
			end
		end
		results
  end
  def is_anagram(word)
    self.downcase.chars.sort.join == word.downcase.chars.sort.join
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
