class Img
	attr_accessor :src, :url, :w, :h, :time

	def initialize src
		@src = src
		@url = ""
		@w = nil
		@h = nil
		@time = 1
	end

	def write
		temp = ""
		temp2 = ""
		@time = @time.to_i
		@time.times do
			temp2 = "<img src='#{@src}' width='#{@w}' height='#{@h}'>"
			temp2 = "<a href='#{@url}'>#{temp2}</a>" if @url != ""
			temp = temp + "\n" + temp2
		end
		temp
	end
end