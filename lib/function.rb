class Function
	attr_accessor :name, :attrs, :objs, :result

	def initialize name, attrs, objs
		@name = name
		@attrs = attrs
		@objs = objs
	end

	def makeObj values
		temp = ""
		rep = @attrs.zip values
		@objs.each do |obj|
			temp2 = obj.write []
			rep.each do |aattr, val|
				temp2.gsub! "\#\{#{aattr.to_s}\}", val.to_s
			end
			temp = temp + "\n" + temp2
		end
		Obj.new temp
	end
end