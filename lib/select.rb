class Select
	attr_accessor :name, :objs

	def initialize name, objs
		@name = name
		@objs = objs
	end

	def write var
		temp = "#{@name}: <select name='#{@name}'>"
		if @objs.kind_of?(Array)
			@objs.each do |obj|
				temp = temp + "\n" + "<option value='#{obj}'>#{obj}</option>"
			end
		else
			temp = temp + "\n" + "<option value='#{@objs}'>#{@objs}</option>"
		end
		var.each do |k, v|
			next unless @objs.include? "\#\{" + k + "\}"
			if v.kind_of?(Array)
				temp.gsub! "\#\{#{k}\}", v[0].to_s
				v[1..-1].each do |item|
					temp = temp + "\n" + "<option value='#{item}'>#{item}</option>"
				end
			else
				temp.gsub! "\#\{#{k}\}", v.to_s
			end
		end
		temp = temp + "\n" + "</select><br>"
		temp
	end
end
