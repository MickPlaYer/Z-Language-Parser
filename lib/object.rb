class Obj
	attr_accessor :result

	def initialize result
		@result = result
	end

	def write
		result
	end
end