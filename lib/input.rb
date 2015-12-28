class Input
	attr_accessor :name, :type, :value

	def initialize name, type, value
		@name = name
		@type = type
		@value = value
	end

	def write var
		temp = "<input name='#{@name}' type='#{@type}' value='#{@value}' /><br>"
		var.each do |k, v|
			temp.gsub! "\#\{#{k}\}", v.to_s
		end
		temp
	end
end