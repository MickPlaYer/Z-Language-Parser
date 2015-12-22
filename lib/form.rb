class Form
	attr_accessor :act, :met, :objs, :time

	def initialize act, met
		@act = act
		@met = met
		@time = 1
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

	def write
		temp = ""
		temp2 = ""
		@time.times do
			temp2 = "<form action='#{@act}' method='#{@met}'>"
			@objs.each do |obj|
				temp2 = temp2 + "\n" + obj.write
			end
			temp2 = temp2 + "\n" + "</form>"
			temp = temp + "\n" + temp2
		end
		temp
	end
end