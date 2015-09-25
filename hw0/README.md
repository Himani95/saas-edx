HW0 PART 1
Check the documentation on Array, Hash and Enumerable as they could help tremendously with these exercises. :-)

Define a method sum which takes an array of integers as an argument and returns the sum of its
elements. For an empty array it should return zero.
Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its
two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.
Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments
and returns true if any two elements in the array of integers sum to n. An empty array should sum to zero by definition.

HW0 PART 2

Define a method hello(name) that takes a string representing a name and returns the string "Hello, "
concatenated with the name.
Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a
consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.)
NOTE: be sure it works for both upper and lower case and for nonletters!
Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents
a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!

HW0 PART 3
Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book as a
floating-point number, price, as attributes. The constructor should accept the ISBN number (a string) as the
first argument and price as second argument, and should raise ArgumentError (one of Ruby's built-in
exception types) if the ISBN number is the empty string or if the price is less than or equal to zero.

Include the proper getters and setters for these attributes. Include a method price_as_string that returns
the price of the book with a leading dollar sign and trailing zeros, that is, a price of 20 should display as
"$20.00" and a price of 33.8 should display as "$33.80".