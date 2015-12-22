class NewLine
	attr_accessor :time, :time_attr

	def initialize
		@time = 1
		@time_attr = nil
	end

	def write var
		temp = ""
		@time.times do
			temp = temp + "\n" + "<br>"
		end
		temp
	end
end