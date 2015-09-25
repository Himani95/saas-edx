class BookInStock
	def initialize(isbn, price)	
		if isbn == "" or price <=0
			raise ArgumentError
		end
		@isbn = isbn
		@price = price
	end

	attr_accessor :isbn

	attr_accessor :price

	def price_as_string()
		suffix = ""
		if @price.round(2).to_s.split('.')[-1].length == 1
			suffix = "0"
		end
		"$" + @price.round(2).to_s + suffix
	end
end

book = BookInStock.new("AB123", 15.65653)
puts "isbn: " + book.isbn
puts "price: " + book.price.to_s
puts "price as string: " + book.price_as_string
book.isbn = "ABC1234"
book.price = 25.7
puts "new isbn: " + book.isbn
puts "new price: " + book.price.to_s
puts "price as string: " + book.price_as_string
