class Dessert
  def initialize(name, calories)
		@name = name
		@calories = calories
  end
	attr_accessor :name
	attr_accessor :calories
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
		@flavor = flavor
    @calories = 5
		@name = @flavor + ' jelly bean'
  end
	attr_accessor :flavor
	def delicious?
		@flavor != 'licorice'
	end
end
