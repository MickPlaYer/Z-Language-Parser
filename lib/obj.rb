class Obj
	attr_accessor :result, :time, :time_attr

	def initialize result
		@result = result
		@time = 1
		@time_attr = nil
	end

	def write var
		res = ""
		@time.times do |i|
			temp2 = @result
			temp2.gsub! "\#\{#{@time_attr.to_s}\}", i.to_s if @time_attr
			res = res + temp2
		end
		var.each do |k, v|
			res.gsub! "\#\{#{k}\}", v.to_s
		end
		res
	end
end