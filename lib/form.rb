class Form
	attr_accessor :act, :met, :objs, :time, :time_attr

	def initialize act, met
		@act = act
		@met = met
		@time = 1
		@time_attr = nil
		@objs = []
	end

	def addInput name, type, value
		@objs << (Input.new name,type,value)
	end

	def addSubmit value
		@objs << (Input.new "submit","submit",value)
	end

	def addSelect name, ary
		@objs << (Select.new name, ary)
	end

	def write var
		temp = ""
		temp2 = ""
		@time.times do
			temp2 = "<form action='#{@act}' method='#{@met}'>"
			@objs.each do |obj|
				temp2 = temp2 + "\n" + (obj.write var)
			end
			temp2 = temp2 + "\n" + "</form>"
			temp2.gsub! "\#\{#{@time_attr.to_s}\}", i.to_s if @time_attr
			temp = temp + "\n" + temp2
		end
		var.each do |k, v|
			temp.gsub! "\#\{#{k}\}", v.to_s
		end
		temp
	end
end