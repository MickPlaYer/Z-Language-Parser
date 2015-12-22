class Input
	attr_accessor :name, :type, :value

	def initialize name, type, value
		@name = name
		@type = type
		@value = value
	end

	def write
		temp = "<input name='#{@name}' type='#{@type}' value='#{@value}' />"
	end
end