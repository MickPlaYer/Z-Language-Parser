class Img
	attr_accessor :src, :url, :w, :h, :time, :time_attr

	def initialize src
		@src = src
		@url = ""
		@w = nil
		@h = nil
		@time = 1
		@time_attr = nil
	end

	def write var
		temp = ""
		temp2 = ""
		@time = @time.to_i
		@time.times do |i|
			temp2 = "<img src='#{@src}' width='#{@w}' height='#{@h}'>"
			temp2 = "<a href='#{@url}'>#{temp2}</a>" if @url != ""
			temp2.gsub! "\#\{#{@time_attr.to_s}\}", i.to_s if @time_attr
			temp = temp + "\n" + temp2
		end
		var.each do |k, v|
			temp.gsub! "\#\{#{k}\}", v.to_s
		end
		temp
	end
end