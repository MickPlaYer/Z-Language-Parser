class Select
	attr_accessor :name, :objs

	def initialize name, objs
		@name = name
		@objs = objs
	end

	def write var
		temp = "<select name='#{@name}'>"
		if @objs.kind_of?(Array)
			@objs.each do |obj|
				temp = temp + "\n" + "<option value='#{obj}'>#{obj}</option>"
			end
		else
			temp = temp + "\n" + "<option value='#{@objs}'>#{@objs}</option>"
		end
		temp = temp + "\n" + "</select>"
		var.each do |k, v|
			temp.gsub! "\#\{#{k}\}", v.to_s
		end
		temp
	end
end